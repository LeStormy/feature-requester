class Board < ApplicationRecord
  has_many :posts
  belongs_to :admin_user
end
