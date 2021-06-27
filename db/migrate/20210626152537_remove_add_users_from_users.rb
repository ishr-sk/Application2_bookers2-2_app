class RemoveAddUsersFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :AddUsers, :string
  end
end
