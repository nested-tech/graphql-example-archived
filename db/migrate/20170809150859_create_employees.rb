class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.references :companies, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :age, null: false
      t.string :email

      t.timestamps
    end

    add_foreign_key :employees, :companies
  end
end
