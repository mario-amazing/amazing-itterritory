# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TopPostsSearcher, type: :service do
  describe '#call' do
    let(:top_count) { 1 }
    let!(:expected_post_statistic) { FactoryBot.create(:post_statistic) }
    let!(:post_statistic) { FactoryBot.create(:post_statistic, average_grade: 1) }

    subject { described_class.call(top_count) }

    it 'return top N posts' do
      expect(subject).to include(expected_post_statistic.post)
    end
  end
end
