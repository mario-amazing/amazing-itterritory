require "rails_helper"

RSpec.describe Rating, type: :model do
  it { should belong_to(:post) }
  it { should validate_inclusion_of(:grade).in_range(1..5) }
end
