class CategoryController < ApplicationController
  def create
    Products::Category.create!(category_params)
  end

  def update
    # update logic
  end

  def remove
    # remove logic
  end

  private

  def category_params
    # typically from UI
    {
      name: 'Bicycle',
      description: 'Bicycle Category'
    }
  end
end
