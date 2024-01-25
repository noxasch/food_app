class Api::V1::Users::Foods::Destroy < ApplicationMutation
  required do
    integer :id
  end

  protected

  def execute
    food.destroy! && { success: true }
  end

  def validate
    add_error(:food, :not_found, 'food not found') unless food
  end

  private

  def food
    @food ||= Food.find_by(id:)
  end
end
