require 'rails_helper'

RSpec.describe Api::V1::PostRatingSerializer, type: :serializer do
  let(:post_statistic) { FactoryBot.create(:post_statistic) }
  let(:serializer) { described_class.new(post_statistic) }
  let(:expected_json_keys) { [ :average_grade ] }

  subject { serializer.as_json }

  it 'should have a name that matches' do
    expect(subject).to include(*expected_json_keys)
  end
end
