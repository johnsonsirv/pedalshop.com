module PartOptionProhibitionHelper
  def self.format(prohibitions, part_options)
    prohibitions.map do |part_option_id, prohibitions_hash|
      {
        part_option_id => {
          name: part_options[part_option_id],
          prohibited_list: format_prohibited_list(prohibitions_hash[part_option_id], part_options)
        }
      }
    end
  end

  private

  def format_prohibited_list(prohibited_ids, part_options)
    prohibited_ids.map do |prohibited_id|
      {
        id: prohibited_id,
        name: part_options[prohibited_id]
      }
    end
  end
end
