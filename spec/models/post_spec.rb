# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:ratings) }
  it { should have_one(:post_statistic) }
  it { should have_one(:user_ip) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end
