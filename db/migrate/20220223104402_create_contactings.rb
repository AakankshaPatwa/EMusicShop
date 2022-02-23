class CreateContactings < ActiveRecord::Migration[5.2]
  def change
    create_table :contactings do |t|
      t.string :name
      t.string :email
      t.string :query

      t.timestamps
    end
  end
end
