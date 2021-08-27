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
  end
  it 'shows all the attributes for the bakery' do
    visit "/bakeries/#{@bakery_1.id}"

    expect(page).to have_content(@bakery_1.name)
    expect(page).to have_content(@bakery_1.id)
    expect(page).to have_content(@bakery_1.delivery)
    expect(page).to have_content(@bakery_1.review)
  end
end
