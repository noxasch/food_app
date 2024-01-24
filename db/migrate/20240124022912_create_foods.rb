class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.decimal :price, null: false, default: 0

      t.timestamps
    end
  end
end
