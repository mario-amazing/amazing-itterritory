class CreateUserIps < ActiveRecord::Migration[5.2]
  def change
    create_table :user_ips do |t|
      t.inet :ip
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
