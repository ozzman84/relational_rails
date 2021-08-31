class Bed < ApplicationRecord
  has_many :guests

  validates :name, presence: true
  validates :occupied, inclusion: { in: [ true, false ] }
  validates :guest_count, presence: true
end
