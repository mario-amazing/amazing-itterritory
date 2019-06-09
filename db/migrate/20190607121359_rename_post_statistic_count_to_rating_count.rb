# frozen_string_literal: true

class RenamePostStatisticCountToRatingCount < ActiveRecord::Migration[5.2]
  def change
    rename_column :post_statistics, :count, :rating_count
  end
end
