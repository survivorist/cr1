class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :subtitle
      t.integer :condition
      t.text :description
      t.decimal :day_price
      t.integer :user_id

      t.timestamps
    end
  end
end
