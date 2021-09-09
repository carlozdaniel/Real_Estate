class CreateEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :estates do |t|
      t.string :name
      t.string :type
      t.string :street
      t.string :external_number
      t.string :Internal_number
      t.string :neighborhood
      t.string :city
      t.string :country
      t.integer :rooms
      t.float :bathrooms
      t.string :comments

      t.timestamps
    end
  end
end
