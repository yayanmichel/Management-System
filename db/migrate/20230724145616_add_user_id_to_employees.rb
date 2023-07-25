class AddUserIdToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :user_id, :integer
  end
end
