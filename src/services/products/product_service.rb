module Products
  class ProductService
    def self.create_with_default_config(category_name, product_details)
      ActiveRecord::Base.transaction do
  
        category = Products::Category.find_by(name: category_name)
        product_config = Config::ConfigService.new(category).default_config
  
        product = Products::Product.create!(
          name: product_details[:name],
          description: product_details[:description],
          category: category
        )
  
        product.set_default_configuration(product_config)
      end
    end
  
    def self.create_part(part_details)
      Products::Part.create!(part_details)
    end
  
    def self.create_part_option(part_option_details)
      Products::PartOption.create!(
        name: part_option_details[:name],
        price: part_option_details[:price],
        in_stock: part_option_details[:in_stock],
        part_id: part_option_details[:part_id]
      )
    end
  
    def self.create_part_option_combinations(part_option_combination_details)
      Products::PartOptionCombination.create!(part_option_combination_details)
    end
  
    def self.create_part_option_prohibitions(prohibition_details)
      Products::PartOptionProhibition.create!(prohibition_details)
    end
  
    def self.update_combination_price(new_combination_price_details)
      Products::PartOptionCombination.update(
        new_combination_price_details[:id],
        combination_price: new_combination_price_details[:price_adjustment]
      )
    end
  
    # Always override part_options value
    # Reason: UI reflects true state each time. Admin can unselect / select
    def self.update_prohibited_part_options(update_prohibition_details)
      Products::PartOptionProhibition.update(
        update_prohibition_details[:id],
        part_options: update_prohibition_details[:part_options]
      )
    end
  end
end
