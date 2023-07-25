class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.text :name
      t.integer :departementID

      t.timestamps
    end
  end
end
