require 'rails_helper'

RSpec.describe 'bakery edit' do
  it 'links to the edit page' do
    bakery = Bakery.create!(name: "Taste of Denmark",
      city: "Lakewood",
      delivery: true,
      review: 5
    )
    visit "/bakeries/#{bakery.id}"
    click_link 'Update Bakery'
    expect(current_path).to eq("/bakeries/#{bakery.id}/edit")
  end

  it ' can edit the bakery' do
    bakery = Bakery.create!(name: "Taste of Denmar",
      city: "Lakewood",
      delivery: true,
      review: 5
    )
    visit "/bakeries/#{bakery.id}"
    expect(page).to have_content('Taste of Denmar')
    click_link 'Update Bakery'
    fill_in('name', with: 'Taste of Denmark')
    fill_in('city', with: 'Lakewood')
    fill_in('review', with: 5)
    click_button 'Update Bakery'
    expect(current_path).to eq("/bakeries")
    expect(page).to have_content('Taste of Denmark')
  end
end
