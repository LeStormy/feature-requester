class AddBoardsToAdminUser < ActiveRecord::Migration[5.1]
  def change
    remove_reference :boards, :users
    add_reference :boards, :admin_users, index: true
  end
end
