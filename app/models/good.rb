class Good < ApplicationRecord
  belongs_to :bakery
  validates :gluten_free, inclusion: [true, false]
  validates :gluten_free, exclusion: [nil]
  validates :name, presence: true
  validates :category, presence: true
  validates :days_old, presence: true

end
