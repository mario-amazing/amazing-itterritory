# frozen_string_literal: true

class CreatePostStatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :post_statistics do |t|
      t.float :average_grade
      t.integer :count
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
