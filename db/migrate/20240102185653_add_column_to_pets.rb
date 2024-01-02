class AddColumnToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :user_id, :integer
  end
end
