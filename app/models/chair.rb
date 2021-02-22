class Chair < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :price, presence: true
  #validates :image, presence: true

  belongs_to :user, dependent: :destroy
  has_many :reservations
  #has_many :reviews through: :reservations

end