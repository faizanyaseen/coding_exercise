class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
