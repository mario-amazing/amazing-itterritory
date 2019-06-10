# frozen_string_literal: true

class Api::V1::SearchPostController < ApplicationController
  def top_posts
    if top_posts_count > 0
      render json: TopPostsSearcher.call(top_posts_count), each_serializer: Api::V1::TopPostsSerializer
    else
      render json: { error: { top_count: :invalid } }, status: :unprocessable_entity
    end
  end

  def uniq_ip_posters
    # Can be expired with 'expires_in: 1.minute' if necessary or can be deleted after
    # post created. Depends on business requirements
    uniq_ip_posters = Rails.cache.fetch("uniq_ip_posters", expires_in: 1.minute) do
      UniqIpPostersSearcher.call.to_json
    end

    render json: uniq_ip_posters
  end

  private

  def post_params
    params.permit(:top_count)
  end

  def top_posts_count
    post_params.fetch(:top_count, 10).to_i
  end
end
