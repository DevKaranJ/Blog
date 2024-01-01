# 20231227085347_create_comments.rb

class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false # Remove `foreign_key: true`

      t.text :text

      t.timestamps
    end
  end
end
