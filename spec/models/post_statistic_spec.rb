require "rails_helper"

RSpec.describe PostStatistic, type: :model do
   it { should belong_to(:post) }
end
