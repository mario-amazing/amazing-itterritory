require "rails_helper"

RSpec.describe PostRatingCreator, :type => :service do
  subject { described_class.new(params)  }

  describe "#call" do
    let(:params) {  { post_id: post.id, grade: grade  } }
    let(:post) { FactoryBot.create(:post) }
    let(:grade) { 3 }

    context 'valid params' do
      context 'create successfully' do
        it "creates rating" do
          expect{ subject.call }.to change{Rating.count}.by(1)
        end

        it "creates post statistic" do
          expect{ subject.call }.to change{PostStatistic.count}.by(1)
        end

        it 'creates post statistic with the average grade' do
          subject.call
          expect(subject.post_statistic.average_grade).to eq(grade)
        end

        context 'find post statistic' do
          let!(:post) { FactoryBot.create(:post, :with_post_statistic) }

          it "does not change post statistic count" do
            expect{ subject.call }.to change{PostStatistic.count}.by(0)
              .and change{post.post_statistic.reload.average_grade}.from(5).to(4)
          end

          it 'updates average rating' do
            subject.call

          end
        end
      end

    end

    context 'with invalid params' do
      let(:grade) { nil }

      it 'rollback transactions' do
        expect{ subject.call }.to change{Rating.count}.by(0)
          .and change{PostStatistic.count}.by(0)
      end
    end
  end
end
