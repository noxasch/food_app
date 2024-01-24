class Api::V1::Users::Foods::Update < ApplicationMutation
  required do
    integer :id
  end
  optional do
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

    @food = Food.find_by(id:)
    @food.assign_attributes(params)
    @food
  end

  def params
    inputs.slice(:name, :price)
  end
end
