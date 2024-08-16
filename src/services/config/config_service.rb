class ConfigService
  def initialize(category)
    @category = category
  end

  def default_product_configuration
    case @category.name
    when PRODUCT_CATEORY[:bicycle]
      bicycle_config
    else
      bicycle_config
    end
  end

  private

  def bicycle_config
    {
      find_part_by_name("frame") => find_part_option_by_name("frame full suspension"),  # Frame => Frame Full Suspension
      find_part_by_name("frame-finish") => find_part_option_by_name("frame-finish shiny"),  # Frame-finish => Frame-finish Shiny
      find_part_by_name("wheels") => find_part_option_by_name("wheels road wheels"),  # Wheels: Road wheels
      find_part_by_name("rim-color") => find_part_option_by_name("rim-color black"),  # Rim-color: Black
      find_part_by_name("chain") => find_part_option_by_name("chain single speed")   # Chain: Single-speed
    }
  end

  def find_part_by_name(part_name)
    Part.find_by(name: part_name)&.id
  end

  def find_part_option_by_name(part_option_name)
    PartOption.find_by(name: part_option_name)&.id
  end
end
