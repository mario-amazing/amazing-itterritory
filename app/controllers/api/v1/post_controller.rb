class Api::V1::PostController < ApplicationController
  def create
    @post = PostCreator.new(post_params).call
    if @post.persisted?
      render json: @post, serializer: Api::V1::PostSerializer, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.permit(:title, :description, :login, :ip)
  end
end
