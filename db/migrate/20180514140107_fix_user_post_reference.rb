class FixUserPostReference < ActiveRecord::Migration[5.1]
  def change
    remove_reference :posts, :users, index: true
    remove_reference :votes, :users, index: true
    remove_reference :votes, :posts, index: true
    remove_reference :comments, :users, index: true
    remove_reference :comments, :posts, index: true
    add_reference :posts, :user, index: true
    add_reference :votes, :user, index: true
    add_reference :votes, :post, index: true
    add_reference :comments, :user, index: true
    add_reference :comments, :post, index: true

  end
end
