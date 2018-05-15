class AddPostBoardRelation < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :board, index: true
  end
end
