class RemoveAdminFromBoard < ActiveRecord::Migration[5.1]
  def change
    remove_reference :boards, :admin_user, index: true
  end
end
