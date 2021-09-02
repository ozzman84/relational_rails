class Good < ApplicationRecord
  belongs_to :bakery
  validates :gluten_free, inclusion: [true, false]
  validates :gluten_free, exclusion: [nil]
  validates :name, presence: true
  validates :category, presence: true
  validates :days_old, presence: true

  scope :over_day,->(days_old) {
    where("days_old > ?", days_old)
  }
  def self.true_only
    self.where("gluten_free = true")
  end

  def self.alpha
    order(:name)
  end
end
