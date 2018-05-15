class AddShortDescriptionForPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :short_description, :string
  end
end
