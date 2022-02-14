class CreateCheckouts < ActiveRecord::Migration[5.2]
  def change
    create_table :checkouts do |t|
      t.text :firstname
      t.text :lastname
      t.string :email
      t.integer :contact
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :pincode

      t.timestamps
    end
  end
end
