class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :boards
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  def name
    email
  end
end
