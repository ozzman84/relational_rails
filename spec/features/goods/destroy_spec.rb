require 'rails_helper'

RSpec.describe 'delete a good' do
  it 'deletes a baked good' do
    bakery_1 = Bakery.create!(name: "Taste of Denmark",
      city: "Lakewood",
      delivery: true,
      review: 5
    )
    good_1 = bakery_1.goods.create!(name: "Cinnamon Roll",
    category: "Pastry",
    days_old: 0,
    gluten_free: true,
    )

    visit "/goods/#{good_1.id}"
    expect(page).to have_button('Delete Good')
    click_button("Delete Good")
    expect(current_path).to eq('/goods')
    expect(page).to_not have_content(good_1.name)
  end
end
