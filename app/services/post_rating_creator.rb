class PostRatingCreator
  attr_reader :errors, :post_statistic

  def initialize(params)
    @params = params
    @errors = {}
  end

  def call
    ActiveRecord::Base.transaction(requires_new: true) do
      create_rating
      calc_avg_rate
    rescue ActiveRecord::RecordInvalid => e
      @errors.merge!(e.record.errors.messages)
      raise ActiveRecord::Rollback
    end
  end

  private

  def create_rating
    @rating = Rating.create!(rating_params)
  end

  def rating_params
    { post_id: @params[:post_id], grade: @params[:grade] }
  end

  def calc_avg_rate
    stat = PostStatistic.find_or_initialize_by(post_id: @params[:post_id]) do |st|
      st.average_grade = 0
      st.rating_count = 0
    end
    stat.lock!

    new_avg = AverageRatingCalculator.new(stat, @params[:grade]).call
    @post_statistic = stat.tap do |s|
      s.average_grade = new_avg.to_f
      s.rating_count += 1
      s.save!
    end
  end
end
