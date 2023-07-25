class AddIdToDepartments < ActiveRecord::Migration[7.0]
  def change
    add_column :departments, :user_id, :integer
  end
end
