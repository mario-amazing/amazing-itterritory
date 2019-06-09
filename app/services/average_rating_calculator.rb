class AverageRatingCalculator
  def initialize(post_statistic, new_grade)
    @post_statistic = post_statistic
    @new_grade = new_grade
  end

  def call
    avg_grade = @post_statistic.average_grade
    rating_count = @post_statistic.rating_count
    ((avg_grade * rating_count) + @new_grade.to_i) / (rating_count + 1)
  end
end
