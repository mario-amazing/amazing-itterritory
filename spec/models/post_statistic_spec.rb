# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostStatistic, type: :model do
  it { should belong_to(:post) }

  it { should validate_presence_of(:average_grade) }
  it { should validate_presence_of(:rating_count) }
end
