class BScript
  # For each OrthoMCL group in a list of groups, print out the OrthoMCL group, 
  # elegans name, and elegans official data's annotation
  def elegans_data_from_orthomcl_groups(
    filename="#{PHD_DIR}/essentiality/final_orthology_group_assign/blastnFix2.essential.orthomcl_groups.txt",
    col_sep = ' ')
    FasterCSV.foreach(filename, :col_sep => col_sep) do |row|
      line = row[0].strip
      
      groups = OrthomclGroup.find_all_by_orthomcl_name(line)
      # error checking
      raise Exception, "Found #{groups.length} OrthoMCL groups for '#{line}'" unless groups.length == 1
      group = groups[0]
      
      # get the elegans gene and official data
      eles = group.orthomcl_genes.code('cel').all #assume OrthoMCL v2 - might change in the future.
      if eles.length == 1
        ele = eles[0]
        
        # print as comments on this method suggest:
        puts [
        group.orthomcl_name,
        ele.orthomcl_name,
        ele.orthomcl_gene_official_data.annotation
        ].join("\t")
        
      else
        puts [group.orthomcl_name, "#{eles.length} C. elegans groups found"].join("\t")
      end
    end
  end
end