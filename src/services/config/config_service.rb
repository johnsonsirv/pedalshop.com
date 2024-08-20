module Config
  class ConfigService
    attr_reader :category

    PartWithOption = Struct.new(:part, :part_option)

    def initialize(category)
      @category = category # will be used in future to determine which config to load.
    end

    def default_config
      @bicycle_config ||= get_bicycle_config # defaults to bicyle
    end
  
    private
  
    def get_bicycle_config
      default_parts.map do |part, option|
        part_id = find_part_by_name(part)
        part_option_id = find_part_option_by_name(option)

        PartWithOption.new(part_id, part_option_id)
      end
    end

    def find_part_by_name(part_name)
      Products::Part.find_by!(name: part_name).id
    rescue ActiveRecord::RecordNotFound
      raise "Part not found: #{part_name}"
    end
    
    def find_part_option_by_name(part_option_name)
      Products::PartOption.find_by!(name: part_option_name).id
    rescue ActiveRecord::RecordNotFound
      raise "Part option not found: #{part_option_name}"
    end

    def default_parts
      # Typically configured on UI
      {
      'frame' => 'frame full suspension',
      'frame-finish' => 'frame-finish shiny',
      'wheels' => 'wheels road wheels',
      'rim-color' => 'rim-color black',
      'chain' => 'chain single speed'
      }
    end
  end
end
