require "rails_helper"

RSpec.describe AverageRatingCalculator, :type => :service do
  subject { described_class.new(post_statistic, new_grade)  }

  describe "#call" do
    let(:post_statistic) { FactoryBot.build_stubbed(:post_statistic) }
    let(:new_grade) { 1 }

    context 'calculate average grade' do
      it "returns average grade" do
        expect( subject.call ).to eq(3)
      end

    end
  end
end

