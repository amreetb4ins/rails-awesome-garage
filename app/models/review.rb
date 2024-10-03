class Review < ApplicationRecord
  belongs_to :car

  validates :comment, presence: true, length: { minimum: 6, too_short: "must have at least 6 characters" }
  validates :rating,  inclusion: { in: 0..5 }
end
