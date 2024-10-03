class Car < ApplicationRecord
  belongs_to :owner

  has_many :favourites
  has_many :reviews, dependent: :destroy

  validates :brand, presence: true
  validates :model, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :fuel, presence: true
end
