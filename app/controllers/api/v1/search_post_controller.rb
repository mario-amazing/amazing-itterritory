class Api::V1::SearchPostController < ApplicationController
  def top_posts
    if top_posts_count > 0
      render json: TopPostsSearcher.call(top_posts_count), each_serializer: Api::V1::TopPostsSerializer
    else 
      render json: { error: { top_count: :invalid } }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.permit(:top_count)
  end

  def top_posts_count
    post_params.fetch(:top_count, 10).to_i
  end
end
