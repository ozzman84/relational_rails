require 'rails_helper'

RSpec.describe "goods index page" do
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
end

it 'can see all the goods in the index' do
  visit "/goods"
  expect(page).to have_content(@good_1.name)
  expect(page).to have_content(@good_1.category)
  expect(page).to have_content(@good_1.days_old)
  expect(page).to have_content(@good_1.gluten_free)
  expect(page).to have_content(@good_1.bakery_id)
  end
end