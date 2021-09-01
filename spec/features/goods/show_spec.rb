require 'rails_helper'

RSpec.describe "good show page" do
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
  @bakery_1 = Bakery.create!(name: "Taste of Denmark",
    city: "Lakewood",
    delivery: true,
    review: 5
  )
  end

  it 'returns a page of the specific good based on id with attributes' do
    visit "/goods/#{@good_1.id}"

    expect(page).to have_content(@good_1.name)
    expect(page).to have_content(@good_1.id)
    expect(page).to have_content(@good_1.category)
    expect(page).to have_content(@good_1.days_old)
    expect(page).to have_content(@good_1.gluten_free)
    expect(page). to have_content(@good_1.bakery_id)
    expect(page). to have_content(@good_1.created_at)
    expect(page). to have_content(@good_1.updated_at)
  end
  it 'has a link at the top that takes users to the parent index' do
    visit "/goods"
    expect(page).to have_link("Bakeries Index")
    click_link("Bakeries Index")
    expect(current_path).to eq("/bakeries")
    expect(page).to have_content("All Bakeries")
    expect(page).to have_content(@bakery_1.name)
  end
end
