# frozen_string_literal: true

class PostRatingCreator
  attr_reader :errors

  def initialize(params)
    @params = params
    @errors = {}
  end

  def call
    ActiveRecord::Base.transaction(requires_new: true) do
      create_rating
      update_post_statistic
    rescue ActiveRecord::RecordInvalid => e
      @errors.merge!(e.record.errors.messages)
      raise ActiveRecord::Rollback
    end
  end

  def post_statistic
    @post_statistic ||= PostStatistic.find_or_initialize_by(post_id: @params[:post_id]) do |st|
      st.average_grade = 0
      st.rating_count = 0
    end
  end

  private

  def create_rating
    @rating = Rating.create!(rating_params)
  end

  def rating_params
    { post_id: @params[:post_id], grade: @params[:grade] }
  end

  def update_post_statistic
    post_statistic.lock!

    new_avg = AverageRatingCalculator.new(post_statistic, @params[:grade]).call
    post_statistic.tap do |s|
      s.average_grade = new_avg.to_f
      s.rating_count += 1
      s.save!
    end
  end
end
