class ProductController < ApplicationController
  def create_with_default_config
    Products::ProductService.create_with_default_config('bicycle', product_details)
  end

  def create_part
    Products::ProductService.create_part(part_details)
  end

  def create_part_option
    Products::ProductService.create_part_option(part_option_details)
  end

  def create_part_option_combinations
    Products::ProductService.create_part_option_combinations(combination_details)
  end

  def create_part_option_prohibitions
    Products::ProductService.create_part_option_prohibitions(prohibition_details)
  end

  def update_combination_price
    Products::ProductService.update_combination_price(
      new_combination_price_details[:id],
      new_combination_price_detailsp[:price_adjustment]
    )
  end

  def update_combination_price
    Products::ProductService.update_combination_price(new_combination_price_details)
  end

  def update_prohibited_part_options
    Products::ProductService.update_prohibited_part_options(update_prohibition_details)
  end

  private

  def product_details
    # Typically from UI
    {
      name: 'Mountain Bike',
      description: 'A classy mountain bike'
    }
  end

  def part_details
    # Typically from UI
    {
      name: "frame"
    }
  end

  def part_option_details
    # Typically from UI
    {
      part_id: "1",
      name: "frame full suspension",
      price: 32.1,
      in_stock: true
    }
  end

  def combination_details
    # Typically from UI
    {
      part_options: {
        '1' => ['2', '5'], # # ids of part options selected together in UI
      }, 
      combination_price: 34.2
    }
  end

  def prohibition_details
    # Typically from UI
    {
      part_options: {
          '1' => ['3', '5'], # ids of prohibited parts for part option
        }
    }
  end

  def new_combination_price_details
    # Typically from UI
    {
      id: '1',
      price_adjustment: 50.4
    }
  end

  def update_prohibition_details
    # Typically from UI
    {
      id: '1',
      part_options: {
          '1' => ['3', '5', '7'], # ids of prohibited parts for part option
        }
    }
  end
end