require 'rails_helper'

RSpec.describe 'delete a good' do
  it 'deletes the good' do
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
    good_2 = Good.create!(name: "Pumbkin Bread",
    category: "Bread",
    days_old: 1,
    gluten_free: false,
    bakery_id: bakery_1.id
    )

    visit "/goods/#{good_1.id}"
    expect(page).to have_button('Delete Good')
    click_button('Delete Good')
    expect(current_path).to eq('/goods')
    expect(page).to_not have_content(good_1.name)
  end
end
