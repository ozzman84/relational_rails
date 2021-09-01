require 'rails_helper'

RSpec.describe 'Delete a Bakery' do
  it 'deletes the bakery' do
    bakery_1 = Bakery.create!(name: "Taste of Denmark",
      city: "Lakewood",
      delivery: true,
      review: 5
    )
    bakery_2 = Bakery.create!(name:"Bread",
    city: "Durango",
    delivery: true,
    review: 4
    )
    visit "/bakeries/#{bakery_1.id}"
    expect(page).to have_button('Delete Bakery')
    click_button('Delete Bakery')
    expect(current_path).to eq('/bakeries')
    expect(page).to_not have_content(bakery_1.name)
  end
end
