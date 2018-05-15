class AddMessageFieldToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :message, :string
  end
end
