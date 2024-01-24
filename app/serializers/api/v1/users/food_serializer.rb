class Api::V1::Users::FoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :created_at

  def created_at
    object.created_at.strftime('%d-%m-%Y')
  end
end
