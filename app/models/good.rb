class Good < ApplicationRecord
  belongs_to :bakery
  validates :gluten_free, presence: true
  validates :name, presence: true
  validates :type, presence: true
  validates :days_old, presence: true
end
