class Good < ApplicationRecord
  belongs_to :bakery
  validates :gluten_free, presence: true
  validates :name, presence: true
  validates :category, presence: true
  validates :days_old, presence: true
  
end
