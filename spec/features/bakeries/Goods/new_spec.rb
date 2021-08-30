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
  expect(current_path).to eq("/bakeries/#{bakery_1.id}/goods/new")
  end

  it 'can create a new good for the selected bakery' do
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

  visit "/bakeries/#{bakery_1.id}/goods/new"
  fill_in('Name', with: 'Sugar Cookie')
  fill_in('Category', with: 'Cookie')
  fill_in('days_old', with: '2')
  fill_in('gluten_free', with: 'true')
  click_button('Create Good')

  expect(current_path).to eq("/bakeries/#{bakery_1.id}/goods")
  expect(page).to have_content('Sugar Cookie')
  end
end
