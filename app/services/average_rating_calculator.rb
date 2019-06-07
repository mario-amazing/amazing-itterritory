class AverageRatingCalculator
  def initialize(rating_statistic, new_grade)
    @rating_statistic = rating_statistic
    @new_grade = new_grade
  end

  def call
    avg_grade = @rating_statistic.average_grade
    rating_count = @rating_statistic.rating_count
    ((avg_grade * rating_count) + @new_grade.to_i) / (rating_count + 1)
  end
end
