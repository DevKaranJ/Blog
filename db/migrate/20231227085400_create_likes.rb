class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    unless table_exists?(:likes)
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
end
