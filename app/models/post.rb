class Post < ApplicationRecord
  belongs_to :user
  belongs_to :board
  belongs_to :parent, optional: true, class_name: "Post"
  has_many :votes
  has_many :comments

end
