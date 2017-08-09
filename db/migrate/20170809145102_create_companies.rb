class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :catch_phrase, null: false

      t.timestamps
    end

    add_index :companies, :name, unique: true
  end
end
