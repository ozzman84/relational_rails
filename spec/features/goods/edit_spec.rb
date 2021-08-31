require 'rails_helper'

RSpec.describe 'good edit' do
  it 'links to the edit page for the goods' do
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
  visit "/goods/#{good_1.id}"
  click_link 'Update Good'
  expect(current_path).to eq("/goods/#{good_1.id}/edit")
  end

  it 'can edit a good' do
    bakery_1 = Bakery.create!(name: "Taste of Denmark",
      city: "Lakewood",
      delivery: true,
      review: 5
    )
    good_1 = Good.create!(name: "Cinnamon Roll",
    category: "Pastr",
    days_old: 1,
    gluten_free: true,
    bakery_id: bakery_1.id
  )
  visit "/goods/#{good_1.id}"
  expect(page).to have_content('Pastr')
  click_link('Update Good')

  fill_in('category', with: 'Pastry')
  fill_in('name', with: 'Cinnamon Roll')
  fill_in('days_old', with: 1)
  click_button 'Update Good'
  expect(current_path).to eq("/goods/#{good_1.id}")
  expect(page).to have_content('Pastry')
  end
end
