class Api::V1::RatingsController < ApplicationController
  def create
    post_rating_creator = PostRatingCreator.new(post_rating_params)
    post_rating_creator.call
    if post_rating_creator.errors.blank?
      render json: post_rating_creator.post_statistic, serializer: Api::V1::PostRatingSerializer, status: :created
    else
      render json: post_rating_creator.errors, status: :unprocessable_entity
    end
  end

  private

  def post_rating_params
    params.permit(:grade, :post_id)
  end
end
