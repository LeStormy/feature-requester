class AddRelations < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :users, index: true
    add_reference :votes, :users, index: true
    add_reference :votes, :posts, index: true
    add_reference :comments, :users, index: true
    add_reference :comments, :posts, index: true
    add_reference :boards, :users, index: true
  end
end
