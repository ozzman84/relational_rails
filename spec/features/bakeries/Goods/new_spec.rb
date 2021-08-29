require 'rails_helper'

RSpec.describe 'the good creation' do
  it 'links to the new page from the bakery goods index' do
    bakery_1 = Bakery.create!(name: "Taste of Denmark",
      city: "Lakewood",
      delivery: true,
      review: 5
    )
    good_1 = Good.create!(name: "Cinnamon Roll",
    category: "Pastry",
    days_old: 0,
    gluten_free: true,
    bakery_id: bakery_1.id
  )
  good_2 = Good.create!(name: "Pumpkin Bread",
  category: "Bread",
  days_old: 1,
  gluten_free: true,
  bakery_id: bakery_1.id
)
  visit "/bakeries/#{bakery_1.id}/goods"
  click_link 'Create Good'
  end
end
