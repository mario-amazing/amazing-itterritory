require 'rails_helper'

RSpec.describe Api::V1::PostSerializer, type: :serializer do
  let(:post) { FactoryBot.create(:post) }
  let(:serializer) { described_class.new(post) }
  let(:expected_json_keys) { [:id, :title, :description, :author_login] }

  subject { serializer.as_json }

  it 'should have a name that matches' do
    expect(subject).to include(*expected_json_keys)
  end
end
