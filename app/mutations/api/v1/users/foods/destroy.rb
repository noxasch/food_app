class Api::V1::Users::Foods::Destroy < ApplicationMutation
  required do
    integer :id
  end

  protected

  def execute
    food.destroy! && { success: true }
  end

  private

  def food
    @food ||= Food.find_by(id:)
  end
end
