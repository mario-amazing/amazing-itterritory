# frozen_string_literal: true

class PostCreator
  attr_reader :errors, :post

  def initialize(params)
    @params = params
    @errors = {}
  end

  def call
    ActiveRecord::Base.transaction(requires_new: true) do
      create_post
      create_user_ip
    rescue ActiveRecord::RecordInvalid => e
      @errors.merge!(e.record.errors.messages)
      raise ActiveRecord::Rollback
    end
  end

  private

  def user
    @user ||= User.find_or_create_by(login: @params[:login])
  end

  def create_post
    @post = Post.create!(post_params)
  end

  def create_user_ip
    UserIp.create!(user_ip_params)
  end

  def post_params
    { user_id: user.id, title: @params[:title], description: @params[:description] }
  end

  def user_ip_params
    { ip: @params[:ip], post_id: @post.id, user_id: @user.id }
  end
end
