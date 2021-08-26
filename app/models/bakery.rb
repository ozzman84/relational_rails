class Bakery < ActiveRecord::Base
  has_many :goods
  validates :name, presence: true
  validates :city, presence: true
  validates :delivery, presence: true #may need to refactor since this is a boolean
  validates :review, presence: true
end
