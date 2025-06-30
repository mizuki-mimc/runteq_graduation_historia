class User < ApplicationRecord
  has_many :stories, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider }
  validates :name, presence: true
end
