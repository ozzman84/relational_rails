class Guest < ApplicationRecord
  belongs_to :bed

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :rent, presence: true
  validates :visiting, inclusion: { in: [ true, false ] }

  scope :currently_visiting, -> { where(visiting: true) }
  #Where is the best place to list this scope
  scope :name_asc, -> { order(:first_name) }
end
