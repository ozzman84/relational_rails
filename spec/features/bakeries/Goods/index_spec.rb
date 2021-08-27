require 'rails_helper'

RSpec.describe 'Bakery Goods index' do
  before :each do
    @bakery_1 = Bakery.create!(name: "Taste of Denmark",
      city: "Lakewood",
      delivery: true,
      review: 5
    )
    @good_1 = Good.create!(name: "Cinnamon Roll",
    category: "Pastry",
    days_old: 0,
    gluten_free: true,
    bakery_id: @bakery_1.id
  )
  @good_2 = Good.create!(name: "Pumpkin Bread",
  category: "Bread",
  days_old: 1,
  gluten_free: true,
  bakery_id: @bakery_1.id
)
  end

  it 'shows the name of all goods for a bakery ' do
    visit "/bakeries/#{@bakery_1.id}/goods"
  end
end
