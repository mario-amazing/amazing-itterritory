require "rails_helper"

RSpec.describe UniqIpPostersSearcher, :type => :service do
  describe "#call" do
    let(:top_count) { 1 }
    let(:expected_post_statistic) { {"141.202.126.126" => ["John", "John"]} }

    subject { described_class.call }

    before do
      2.times { FactoryBot.create(:user_ip) }
      FactoryBot.create(:user_ip, ip: "141.202.126.127")
    end

    it 'return uniq ip with logins' do
      expect(subject).to include(expected_post_statistic)
    end
  end
end
