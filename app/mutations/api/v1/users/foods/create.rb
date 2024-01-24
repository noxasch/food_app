class Api::V1::Users::Foods::Create < ApplicationMutation
  required do
    string :name
    float :price
  end

  protected

  def execute
    food.save! && food.reload
  end

  def validate
    model_errors(food) unless food.valid?
  end

  private

  def food
    return @food if @food

    @food = Food.new(params)
    @food
  end

  def params
    inputs.slice(:name, :price)
  end
end
