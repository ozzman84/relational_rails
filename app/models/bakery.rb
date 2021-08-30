class Bakery < ApplicationRecord
  has_many :goods
  validates :name, presence: true
  validates :city, presence: true
  validates :delivery, inclusion: [true, false]
  validates :delivery, exclusion: [nil]
  validates :review, presence: true


  def self.ordered_creation
    self.order(created_at: :desc)
  end
end
