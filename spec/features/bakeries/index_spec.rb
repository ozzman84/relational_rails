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
  it "can see all names of the parent index" do

    visit "/bakeries"
    expect(page).to have_content(@bakery_1.name)
    expect(page).to have_content(@bakery_2.name)
  end
end
