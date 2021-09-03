class CreateEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :estates do |t|
      t.text :name
      t.integer :price
      t.text :adress
      t.integer :year
      t.text :content

      t.timestamps
    end
  end
end
