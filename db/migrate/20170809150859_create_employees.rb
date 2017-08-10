class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.integer :company_id, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :age, null: false
      t.string :email

      t.timestamps
    end

    add_foreign_key :employees, :companies, column: :company_id, primary_key: :id
  end
end
