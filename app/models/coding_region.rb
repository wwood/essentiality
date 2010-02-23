require 'bio'
require 'tempfile'
require 'reach'


class CodingRegion < ActiveRecord::Base
  # Worm project
  # elegans
  has_many :coding_region_phenotype_informations, :dependent => :destroy
  has_many :phenotype_informations, :through => :coding_region_phenotype_informations
  has_many :coding_region_phenotype_observeds, :dependent => :destroy
  has_many :phenotype_observeds, :through => :coding_region_phenotype_observeds
  #mouse
  has_many :coding_region_mouse_phenotypes, :dependent => :destroy
  has_many :mouse_phenotypes, :through => :coding_region_mouse_phenotypes, :dependent => :destroy
  #yeast
  has_many :coding_region_yeast_pheno_infos, :dependent => :destroy
  has_many :yeast_pheno_infos, :through => :coding_region_yeast_pheno_infos
  #drosophila
  has_many :coding_region_drosophila_allele_genes, :dependent => :destroy
  has_many :drosophila_allele_genes, :through => :coding_region_drosophila_allele_genes
  has_many :coding_region_drosophila_rnai_lethalities, :dependent => :destroy
  has_many :drosophila_rnai_lethalities, :through => :coding_region_drosophila_rnai_lethalities
  
  # Return the coding region associated with the string id. The string_id
  # can be either a real id, or an alternate id.
  def self.find_by_name_or_alternate(string_id)
    simple = CodingRegion.find_by_string_id string_id
    if simple
      return simple
    else
      alt = CodingRegionAlternateStringId.find_by_name string_id
      if alt
        return alt.coding_region
      else
        return nil
      end
    end
  end
  
  # Return the coding region associated with the string id. The string_id
  # can be either a real id, or an alternate id.
  def self.find_all_by_name_or_alternate(string_id)
    simple = CodingRegion.find_all_by_string_id string_id
    if !simple.empty?
      return simple
    else
      alts = CodingRegionAlternateStringId.find_all_by_name string_id
      if alts
        return alts.pick(:coding_region).uniq
      else
        return []
      end
    end
  end

  # Given a gene name that may or may not have a prefix and a species
  # common name, return all genes that fit the criteria
  def self.find_all_by_name_or_alternate_and_species_maybe_with_species_prefix(string_id, species_common_name)
    sp = Species.find_species_from_prefix(string_id)
    sp2 = Species.find_by_name(species_common_name)
    if sp
      # if there is a prefix and it isn't the same as the common name, something has gone wrong.
      raise Exception,
        "Prefix of gene name does not fit species common name: #{string_id}, #{species_common_name}" unless sp2 == sp or sp.nil?
      return find_all_by_name_or_alternate_and_species(
        sp.remove_species_prefix(string_id), species_common_name
      )
    else
      return find_all_by_name_or_alternate_and_species(string_id, species_common_name)
    end
  end
  
  # Return the coding region associated with the string id. The string_id
  # can be either a real id, or an alternate id.
  def self.find_all_by_name_or_alternate_and_species(string_id, species_common_name)
    simple = CodingRegion.s(species_common_name).find_all_by_string_id string_id
    if !simple.empty?
      return simple
    else
      alts = CodingRegionAlternateStringId.s(species_common_name).find_all_by_name string_id
      if alts
        return alts.pick(:coding_region).uniq
      else
        return []
      end
    end
  end

  def self.find_all_by_name_or_alternate_or_strain_orthologue_and_species(string_id, species_common_name)
    simple = find_all_by_name_or_alternate_and_species(string_id, species_common_name)
    return simple unless simple.empty?

    # I reckon this will be faster than a join all the way through because
    # the there is unlikely to be many duplicate strain orthologue names
    # from different species.
    return CodingRegionStrainOrthologue.find_all_by_name(string_id).select{|o|
      o.coding_region.species.name == species_common_name
    }
  end
  
  def self.find_by_name_or_alternate_and_organism(string_id, organism_common_name)
    simple = CodingRegion.find(:first,
      :include => {:gene => {:scaffold => :species}},
      :conditions => ["species.name=? and coding_regions.string_id=?", 
        organism_common_name, string_id
      ]
    )
    if simple
      return simple
    else
      alt = CodingRegionAlternateStringId.find(:first,
        :include => {:coding_region => {:gene => {:scaffold => :species}}},
        :conditions => ["species.name= ? and coding_region_alternate_string_ids.name= ?", 
          organism_common_name, string_id
        ]
      )
      if alt
        return alt.coding_region
      else
        return nil
      end
    end    
  end
  
  def find_by_name_or_alternate_and_orthomcl_three_letter(name, orthomcl_three_letter)
    simple = CodingRegion.find(:first,
      :joins => {:gene => {:scaffold => :species}},
      :conditions => ["species.orthomcl_three_letter=? and coding_regions.string_id=?", 
        orthomcl_three_letter, name
      ]
    )
    if simple
      return simple
    else
      alt = CodingRegionAlternateStringId.find(:first,
        :joins => {:coding_region => {:gene => {:scaffold => :species}}},
        :conditions => ["species.orthomcl_three_letter=? and coding_regions.string_id=?", 
          orthomcl_three_letter, name
        ]
      )
      if alt
        return alt.coding_region
      else
        return nil
      end
    end  
  end
  
  def self.unknown_orientation_char
    UNKNOWN_ORIENTATION
  end
end




class CodingRegionNotFoundException < Exception; end
class UnexpectedOrthomclGeneCount < Exception; end
