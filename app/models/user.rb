class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  has_many :sales, dependent: :destroy
  has_many :products, dependent: :destroy
end
