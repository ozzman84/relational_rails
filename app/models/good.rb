class Good < ApplicationRecord
  belongs_to :bakery
  validates :gluten_free, inclusion: [true, false]
  validates :name, presence: true
  validates :category, presence: true
  validates :days_old, presence: true

  def self.true_only
    self.where("gluten_free = true")
  end

  def self.sort_alpha
    self.order("name")
  end
end
#add in good count method
