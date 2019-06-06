require "rails_helper"

RSpec.describe PostCreator, :type => :service do
  subject { described_class.new(params)  }

  describe "#call" do
    let(:params) {  { login: login , title: title, description: title, ip: ip } }
    let(:login) { 'login_test' }
    let(:title) { 'title_test' }
    let(:description) { 'description_test' }
    let(:ip) { '0.0.0.0' }

    context 'valid params' do
      context 'create successfully' do
        it "creates user" do
          expect{ subject.call }.to change{User.count}.by(1)
        end

        it "creates post" do
          expect{ subject.call }.to change{Post.count}.by(1)
        end

        it "creates user_ip" do
          expect{ subject.call }.to change{UserIp.count}.by(1)
        end
      end

      context 'find user login successfully' do
        before do
          subject.call
        end

        it "find user" do
          expect{ subject.call }.to change{User.count}.by(0)
        end
      end
    end

    context 'with invalid params' do
      let(:params) {
        {
          login_invalid: 'login_test',
          title_invalid: 'title_test',
          description_invalid: 'description_test',
          ip_invalid: '0.0.0.0_test'
        }
      }

      context 'does not create' do
        it "user" do
          expect{ subject.call }.to change{User.count}.by(0)
        end

        it "post" do
          expect{ subject.call }.to change{Post.count}.by(0)
        end

        it "user_ip" do
          expect{ subject.call }.to change{UserIp.count}.by(0)
        end
      end
    end

    context 'ip invalid' do
      let(:ip) { 'invalid' }

      it 'rollback transactions' do
        expect{ subject.call }.to change{User.count}.by(0)
          .and change{Post.count}.by(0)
          .and change{UserIp.count}.by(0)
      end
    end
  end
end
