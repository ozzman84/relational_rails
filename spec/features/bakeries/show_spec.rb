require 'rails_helper'

RSpec.describe 'Parents name index', type: :feature do
  before :each do
    @bakery_1 = Bakery.create!(name: "Taste of Denmark",
      city: "Lakewood",
      delivery: true,
      review: 5
    )
    @bakery_2 = Bakery.create!(name:"Bread",
    city: "Durango",
    delivery: true,
    review: 4
    )
    @good_1 = Good.create!(name:"Choc Cookie", category: "Cookie",
    days_old: 0, gluten_free: true, bakery_id: @bakery_1.id)
  end
  it 'shows all the attributes for the bakery' do
    visit "/bakeries/#{@bakery_1.id}"

    expect(page).to have_content(@bakery_1.name)
    expect(page).to have_content(@bakery_1.id)
    expect(page).to have_content(@bakery_1.delivery)
    expect(page).to have_content(@bakery_1.review)
    expect(page).to have_content(@bakery_1.created_at)
    expect(page).to have_content(@bakery_1.updated_at)
  end

  it 'has a link to take it to the childs index page' do
    visit "/bakeries/#{@bakery_1.id}"
    expect(page).to have_link(@bakery_1.name)

    click_link(@bakery_1.name)
    expect(current_path).to eq("/bakeries/#{@bakery_1.id}/goods")
    expect(page).to have_content(@good_1.name)
  end

  it 'can count the number of goods a bakery has' do
    visit "/bakeries/#{@bakery_1.id}"
    expect(page).to have_content(@bakery_1.goods_count)
  end

  it 'has a link to update the bakery' do
    visit "/bakeries/#{@bakery_1.id}"
    expect(page).to have_link("Update Bakery")
    click_link("Update Bakery")
    expect(current_path).to eq("/bakeries/#{@bakery_1.id}/edit")
  end

  it "has a link to delete a bakery" do
    visit "/bakeries/#{@bakery_1.id}"
    expect(page).to have_button("Delete Bakery")
  end
end
