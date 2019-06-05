class Api::V1::PostController < ApplicationController
  def create
    post_creator = PostCreator.new(post_params)
    post_creator.call
    if post_creator.errors.blank?
      render json: post_creator.post, serializer: Api::V1::PostSerializer, status: :created
    else
      render json: post_creator.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.permit(:title, :description, :login, :ip)
  end
end
