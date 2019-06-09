# frozen_string_literal: true

class TopPostsSearcher
  def self.call(top_count)
    Post
      .includes(:post_statistic)
      .order('post_statistics.average_grade desc')
      .limit(top_count)
  end
end
