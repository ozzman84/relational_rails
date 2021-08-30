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
  it "can see all names of the parent index" do

    visit "/bakeries"
    expect(page).to have_content(@bakery_1.name)
    expect(page).to have_content(@bakery_2.name)
  end

  it 'has a link to its child index' do
    visit '/bakeries'
    expect(page).to have_link('Goods Index')

    click_link('Goods Index')
    expect(current_path).to eq("/goods")
    expect(page).to have_content('All Goods')
    expect(page).to have_content(@good_1.name)
  end
end
