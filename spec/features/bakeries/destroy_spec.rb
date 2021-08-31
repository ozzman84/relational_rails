require 'rails_helper'

RSpec.describe 'Delete a Bakery' do
  it 'links to the delete page' do
    bakery_1 = Bakery.create!(name: "Taste of Denmark",
      city: "Lakewood",
      delivery: true,
      review: 5
    )
    @bakery_2 = Bakery.create!(name:"Bread",
    city: "Durango",
    delivery: true,
    review: 4
    )
    visit "/bakeries/#{bakery_1.id}"
    expect(page).to have_button('Delete Bakery')
    click_button('Delete Bakery')

  end
end
