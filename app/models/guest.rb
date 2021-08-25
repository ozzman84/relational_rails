class Guest < ApplicationRecord
  belongs_to :bed

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :rent, presence: true
  validates :visiting, presence: true
end
