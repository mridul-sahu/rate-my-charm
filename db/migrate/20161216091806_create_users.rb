class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :picture
      t.integer :rating

      t.timestamps
    end
  end
end
