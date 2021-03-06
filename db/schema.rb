# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_607_121_359) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'post_statistics', force: :cascade do |t|
    t.float 'average_grade'
    t.integer 'rating_count'
    t.bigint 'post_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_post_statistics_on_post_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.bigint 'user_id'
    t.string 'title'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'rating_table_views', force: :cascade do |t|
    t.float 'average_grade'
    t.bigint 'post_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_rating_table_views_on_post_id'
  end

  create_table 'ratings', force: :cascade do |t|
    t.integer 'grade'
    t.bigint 'post_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_ratings_on_post_id'
  end

  create_table 'user_ips', force: :cascade do |t|
    t.inet 'ip'
    t.bigint 'post_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_user_ips_on_post_id'
    t.index ['user_id'], name: 'index_user_ips_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'login'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'post_statistics', 'posts'
  add_foreign_key 'posts', 'users'
  add_foreign_key 'rating_table_views', 'posts'
  add_foreign_key 'ratings', 'posts'
  add_foreign_key 'user_ips', 'posts'
  add_foreign_key 'user_ips', 'users'
end
