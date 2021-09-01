require 'rails_helper'

RSpec.describe "goods index page" do
  before :each do
    @bakery_1 = Bakery.create!(name: "Taste of Denmark",
      city: "Lakewood",
      delivery: true,
      review: 5
    )
    @good_1 = @bakery_1.goods.create!(name: "Cinnamon Roll",
    category: "Pastry",
    days_old: 0,
    gluten_free: true,
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

  it 'has a link at the top that takes users to the parent index' do
    visit "/goods"
    expect(page).to have_link("Bakeries Index")
    click_link("Bakeries Index")
    expect(current_path).to eq("/bakeries")
    expect(page).to have_content("All Bakeries")
    expect(page).to have_content(@bakery_1.name)
  end
  it 'has a link to edit the child for each good' do
    visit '/goods'
    expect(has_link?("Update #{@good_1.name}")).to eq(true)
    click_link("Update #{@good_1.name}")
    expect(current_path).to eq("/goods/#{@good_1.id}/edit")
  end
  it 'has a link to delete the good for each good' do
    visit '/goods'
    expect(has_link?("Delete #{@good_1.name}")).to eq(true)
    click_link("Delete #{@good_1.name}")
    expect(current_path).to eq("/goods")
    expect(page).to_not have_content(@good_1.name)
  end
end
