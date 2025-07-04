class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { business_owner: 0, admin: 1, developer: 2 }
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
end
