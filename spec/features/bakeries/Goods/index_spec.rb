require 'rails_helper'

RSpec.describe 'Bakery Goods index' do
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
  @good_2 = Good.create!(name: "Pumpkin Bread",
  category: "Bread",
  days_old: 1,
  gluten_free: true,
  bakery_id: @bakery_1.id
)
  end

  it 'shows the name of all goods for a bakery ' do
    visit "/bakeries/#{@bakery_1.id}/goods"

    expect(page).to have_content(@bakery_1.name)
    expect(page).to have_content(@good_1.name)
    expect(page).to have_content(@good_1.category)
    expect(page).to have_content(@good_1.days_old)
    expect(page).to have_content(@good_1.gluten_free)
    expect(page).to have_content(@good_1.bakery_id)
    expect(page).to have_content(@good_2.name)
    expect(page).to have_content(@good_2.category)
    expect(page).to have_content(@good_2.days_old)
    expect(page).to have_content(@good_2.gluten_free)
    expect(page).to have_content(@good_2.bakery_id)
  end

  it 'has a link to its child index' do
    visit '/bakeries'
    expect(page).to have_link('Goods Index')

    click_link('Goods Index')
    expect(current_path).to eq("/goods")
    expect(page).to have_content('All Goods')
    expect(page).to have_content(@good_1.name)
  end
  it 'has a link at the top that takes users to the parent index' do
    visit "/goods"
    expect(page).to have_link("Bakeries Index")
    click_link("Bakeries Index")
    expect(current_path).to eq("/bakeries")
    expect(page).to have_content("All Bakeries")
    expect(page).to have_content(@bakery_1.name)
  end

  describe 'search by threshold' do
    it 'has a link to the threshold form' do
      visit "/bakeries/#{@bakery_1.id}/goods"
      find_button('Add Filter')

      fill_in('day_old_discount', with: 0)
      expect(page).to have_content(@good_2.name)
    end
  end

  it 'has a link to edit the good for each good' do
    visit "/bakeries/#{@bakery_1.id}/goods"
    expect(has_link?("Update #{@good_1.name}")).to eq(true)
    click_link "Update #{@good_1.name}"
  end
end
