class Api::V1::Users::FoodsController < ApplicationController
  def index
    render json: foods,
           each_serializer: ::Api::V1::Users::FoodSerializer,
           adapter: :json
  end

  def show
    if food
      render json: food,
             status: :ok,
             serializer: ::Api::V1::Users::FoodSerializer
    else
      render json: { errors: { not_found: 'Record cannot be found' } }, status: :not_found
    end
  end

  def create
    outcome = Api::V1::Users::Foods::Create.run(create_params)

    if outcome.success?
      render json: outcome.result,
             status: :created,
             serializer: ::Api::V1::Users::FoodSerializer
    else
      render json: { errors: outcome.errors }, status: :unprocessable_entity
    end
  end

  def update
    outcome = Api::V1::Users::Foods::Update.run(update_params)

    if outcome.success?
      render json: outcome.result,
             status: :accepted,
             serializer: ::Api::V1::Users::FoodSerializer
    else
      render json: { errors: outcome.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    outcome = Api::V1::Users::Foods::Destroy.run(destroy_params)

    if outcome.success?
      render json: { success: true }, status: :accepted
    else
      render json: { errors: outcome.errors }, status: :unprocessable_entity
    end
  end

  private

  def foods
    @foods ||= Food.all
  end

  def food
    @food ||= Food.find_by(id: params[:id])
  end

  def destroy_params
    params.permit(:id)
  end

  def create_params
    params.permit(:name, :price)
  end

  def update_params
    params.permit(:id, :name, :price)
  end
end
