# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100213235446) do


  create_table "coding_region_alternate_string_ids", :force => true do |t|
    t.integer  "coding_region_id", :null => false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "source"
  end

  add_index "coding_region_alternate_string_ids", ["coding_region_id", "name", "source"], :name => "index_coding_region_alternate_string_ids_on_coding_region_id_an"
  add_index "coding_region_alternate_string_ids", ["coding_region_id", "name", "type"], :name => "index4", :unique => true
  add_index "coding_region_alternate_string_ids", ["coding_region_id", "name"], :name => "index3"
  add_index "coding_region_alternate_string_ids", ["coding_region_id", "type", "name"], :name => "index2"
  add_index "coding_region_alternate_string_ids", ["coding_region_id", "type"], :name => "index1"
  add_index "coding_region_alternate_string_ids", ["coding_region_id"], :name => "index_coding_region_alternate_string_ids_on_coding_region_id"
  add_index "coding_region_alternate_string_ids", ["name"], :name => "index_coding_region_alternate_string_ids_on_name"

  create_table "coding_region_drosophila_allele_genes", :force => true do |t|
    t.integer  "coding_region_id",          :null => false
    t.integer  "drosophila_allele_gene_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coding_region_drosophila_allele_genes", ["coding_region_id"], :name => "index_coding_region_drosophila_allele_genes_on_coding_region_id"
  add_index "coding_region_drosophila_allele_genes", ["drosophila_allele_gene_id"], :name => "index_coding_region_drosophila_allele_genes_on_drosophila_allel"

  create_table "coding_region_drosophila_rnai_lethalities", :force => true do |t|
    t.integer  "coding_region_id",             :null => false
    t.integer  "drosophila_rnai_lethality_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coding_region_mouse_phenotypes", :force => true do |t|
    t.integer  "coding_region_id"
    t.integer  "mouse_phenotype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coding_region_mouse_phenotypes", ["coding_region_id", "mouse_phenotype_id"], :name => "index_coding_region_mouse_phenotype_informations_on_coding_regi", :unique => true

  create_table "coding_region_network_edges", :force => true do |t|
    t.integer  "network_id",              :null => false
    t.integer  "coding_region_id_first",  :null => false
    t.integer  "coding_region_id_second", :null => false
    t.decimal  "strength"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coding_region_network_edges", ["network_id", "coding_region_id_first", "coding_region_id_second"], :name => "index_coding_region_network_edges_on_network_id_and_coding_regi", :unique => true

  create_table "coding_region_phenotype_informations", :force => true do |t|
    t.integer  "coding_region_id"
    t.integer  "phenotype_information_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coding_region_phenotype_informations", ["coding_region_id", "phenotype_information_id"], :name => "index_coding_region_phenotype_informations_on_coding_region_id_", :unique => true
  add_index "coding_region_phenotype_informations", ["coding_region_id"], :name => "index_coding_region_phenotype_informations_on_coding_region_id"
  add_index "coding_region_phenotype_informations", ["phenotype_information_id"], :name => "index_coding_region_phenotype_informations_on_phenotype_informa"

  create_table "coding_region_phenotype_observeds", :force => true do |t|
    t.integer  "coding_region_id"
    t.integer  "phenotype_observed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coding_region_phenotype_observeds", ["coding_region_id", "phenotype_observed_id"], :name => "index_coding_region_phenotype_observeds_on_coding_region_id_and", :unique => true

  create_table "coding_region_strain_orthologues", :force => true do |t|
    t.integer  "coding_region_id", :null => false
    t.string   "name",             :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coding_region_yeast_pheno_infos", :force => true do |t|
    t.integer  "coding_region_id",    :null => false
    t.integer  "yeast_pheno_info_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coding_region_yeast_pheno_infos", ["coding_region_id", "yeast_pheno_info_id"], :name => "index_coding_region_yeast_pheno_infos_on_coding_region_id_and_y", :unique => true
  add_index "coding_region_yeast_pheno_infos", ["coding_region_id"], :name => "index_coding_region_yeast_pheno_infos_on_coding_region_id"
  add_index "coding_region_yeast_pheno_infos", ["yeast_pheno_info_id"], :name => "index_coding_region_yeast_pheno_infos_on_yeast_pheno_info_id"

  create_table "coding_regions", :force => true do |t|
    t.integer  "gene_id"
    t.integer  "jgi_protein_id"
    t.integer  "upstream_distance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "string_id"
    t.string   "orientation"
  end

  add_index "coding_regions", ["gene_id"], :name => "index_coding_regions_on_gene_id"
  add_index "coding_regions", ["orientation"], :name => "index_coding_regions_on_orientation"
  add_index "coding_regions", ["string_id", "gene_id"], :name => "index_coding_regions_on_string_id_and_gene_id", :unique => true
  add_index "coding_regions", ["string_id"], :name => "index_coding_regions_on_string_id"


  create_table "drosophila_allele_genes", :force => true do |t|
    t.string   "allele",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "drosophila_allele_genes", ["allele"], :name => "index_drosophila_allele_genes_on_allele", :unique => true

  create_table "drosophila_allele_phenotype_drosophila_allele_genes", :force => true do |t|
    t.integer  "drosophila_allele_gene_id",      :null => false
    t.integer  "drosophila_allele_phenotype_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "drosophila_allele_phenotype_drosophila_allele_genes", ["drosophila_allele_gene_id"], :name => "drosophila_allele_phenotype_dag_dag"
  add_index "drosophila_allele_phenotype_drosophila_allele_genes", ["drosophila_allele_phenotype_id"], :name => "drosophila_allele_phenotype_dag_dap"

  create_table "drosophila_allele_phenotypes", :force => true do |t|
    t.string   "phenotype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "drosophila_allele_phenotypes", ["phenotype"], :name => "index_drosophila_allele_phenotypes_on_phenotype"

  create_table "drosophila_rnai_lethalities", :force => true do |t|
    t.string   "lethality",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "drosophila_rnai_lethalities", ["lethality"], :name => "index_drosophila_rnai_lethalities_on_lethality", :unique => true

  create_table "export_preds", :force => true do |t|
    t.integer  "coding_region_id", :null => false
    t.boolean  "predicted"
    t.decimal  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end


  add_index "gene_alternate_names", ["gene_id"], :name => "index_gene_alternate_names_on_gene_id"
  add_index "gene_alternate_names", ["name"], :name => "index_gene_alternate_names_on_name"

  create_table "gene_network_edges", :force => true do |t|
    t.integer  "gene_network_id", :null => false
    t.integer  "gene_id_first",   :null => false
    t.integer  "gene_id_second",  :null => false
    t.decimal  "strength"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gene_network_edges", ["gene_id_first"], :name => "index_gene_network_edges_on_gene_id_first"
  add_index "gene_network_edges", ["gene_id_second"], :name => "index_gene_network_edges_on_gene_id_second"
  add_index "gene_network_edges", ["gene_network_id", "gene_id_first", "gene_id_second"], :name => "index_gene_network_edges_on_gene_network_id_and_gene_id_first_a", :unique => true

  create_table "gene_networks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "scaffold_id"
  end

  add_index "genes", ["scaffold_id"], :name => "index_genes_on_scaffold_id"

  create_table "go_alternates", :force => true do |t|
    t.string   "go_identifier"
    t.integer  "go_term_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end


  create_table "integer_coding_region_measurements", :force => true do |t|
    t.string   "type"
    t.integer  "coding_region_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "integer_coding_region_measurements", ["type", "coding_region_id"], :name => "index_integer_coding_region_measurements_on_type_and_coding_reg"

  create_table "kawaii_snippets", :force => true do |t|
    t.string "key",   :limit => 50
    t.text   "value"
  end


  create_table "mouse_phenotype_dictionary_entries", :force => true do |t|
    t.string   "pheno_id",   :null => false
    t.string   "pheno_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mouse_phenotype_dictionary_entries", ["pheno_desc", "pheno_id"], :name => "index_mouse_pheno_descs_on_pheno_desc_and_pheno_id", :unique => true
  add_index "mouse_phenotype_dictionary_entries", ["pheno_id"], :name => "index_mouse_pheno_descs_on_pheno_id", :unique => true

  create_table "mouse_phenotype_mouse_phenotype_dictionary_entries", :force => true do |t|
    t.integer  "mouse_phenotype_id",                  :null => false
    t.integer  "mouse_phenotype_dictionary_entry_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mouse_phenotype_mouse_phenotype_dictionary_entries", ["mouse_phenotype_id", "mouse_phenotype_dictionary_entry_id"], :name => "index_mouse_phenotype_mouse_phenotype_dictionary_entries_on_mou", :unique => true

  create_table "mouse_phenotypes", :force => true do |t|
    t.string   "mgi_allele",  :null => false
    t.string   "allele_type"
    t.string   "mgi_marker"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mverifications", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "networks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "networks", ["name"], :name => "index_networks_on_name", :unique => true

  create_table "orthomcl_gene_coding_regions", :force => true do |t|
    t.integer  "coding_region_id"
    t.integer  "orthomcl_gene_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orthomcl_gene_coding_regions", ["coding_region_id", "orthomcl_gene_id"], :name => "index_orthomcl_gene_coding_regions_on_coding_region_id_and_orth", :unique => true
  add_index "orthomcl_gene_coding_regions", ["coding_region_id"], :name => "index_orthomcl_gene_coding_regions_on_coding_region_id"
  add_index "orthomcl_gene_coding_regions", ["orthomcl_gene_id"], :name => "index_orthomcl_gene_coding_regions_on_orthomcl_gene_id"

  create_table "orthomcl_gene_official_datas", :force => true do |t|
    t.integer  "orthomcl_gene_id"
    t.text     "sequence"
    t.text     "annotation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orthomcl_gene_official_datas", ["orthomcl_gene_id"], :name => "index_orthomcl_gene_official_datas_on_orthomcl_gene_id", :unique => true

  create_table "orthomcl_gene_orthomcl_group_orthomcl_runs", :force => true do |t|
    t.integer  "orthomcl_gene_id",  :null => false
    t.integer  "orthomcl_group_id"
    t.integer  "orthomcl_run_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orthomcl_gene_orthomcl_group_orthomcl_runs", ["orthomcl_gene_id", "orthomcl_run_id", "orthomcl_group_id"], :name => "ogogor", :unique => true
  add_index "orthomcl_gene_orthomcl_group_orthomcl_runs", ["orthomcl_gene_id", "orthomcl_run_id"], :name => "ogog", :unique => true
  add_index "orthomcl_gene_orthomcl_group_orthomcl_runs", ["orthomcl_group_id"], :name => "index_orthomcl_gene_orthomcl_group_orthomcl_runs_on_orthomcl_gr"

  create_table "orthomcl_genes", :force => true do |t|
    t.string   "orthomcl_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orthomcl_genes", ["orthomcl_name"], :name => "index_orthomcl_genes_on_orthomcl_name"

  create_table "orthomcl_groups", :force => true do |t|
    t.string   "orthomcl_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orthomcl_groups", ["orthomcl_name"], :name => "index_orthomcl_groups_on_orthomcl_name"

  create_table "orthomcl_localisation_conservations", :force => true do |t|
    t.integer  "orthomcl_group_id", :null => false
    t.string   "conservation",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orthomcl_localisation_conservations", ["conservation"], :name => "index_orthomcl_localisation_conservations_on_conservation"
  add_index "orthomcl_localisation_conservations", ["orthomcl_group_id"], :name => "index_orthomcl_localisation_conservations_on_orthomcl_group_id"

  create_table "orthomcl_runs", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orthomcl_runs", ["name"], :name => "index_orthomcl_runs_on_name", :unique => true

  create_table "phenotype_informations", :force => true do |t|
    t.string   "dbxref"
    t.string   "phenotype"
    t.integer  "experiments"
    t.integer  "primary"
    t.integer  "specific"
    t.integer  "observed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phenotype_observeds", :force => true do |t|
    t.string   "dbxref"
    t.string   "phenotype"
    t.integer  "experiments"
    t.integer  "primary"
    t.integer  "specific"
    t.integer  "observed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scaffolds", :force => true do |t|
    t.integer  "species_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "length"
  end

  add_index "scaffolds", ["species_id"], :name => "index_scaffolds_on_species_id"

  create_table "species", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "orthomcl_three_letter"
  end

  create_table "yeast_pheno_infos", :force => true do |t|
    t.string   "experiment_type", :null => false
    t.string   "phenotype",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mutant_type",     :null => false
  end
end
