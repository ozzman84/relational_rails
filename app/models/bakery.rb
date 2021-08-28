class Bakery < ApplicationRecord
  has_many :goods
  validates :name, presence: true
  validates :city, presence: true
  validates :delivery, presence: true #may need to refactor since this is a boolean
  validates :review, presence: true


  def self.ordered_creation
    self.order(created_at: :desc)
  end
end
