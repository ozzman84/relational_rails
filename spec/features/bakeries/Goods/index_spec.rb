require 'rails_helper'

RSpec.describe 'Bakery Goods index' do
  before :each do
    @bakery_1 = Bakery.create!(name: "Taste of Denmark",
      city: "Lakewood",
      delivery: true,
      review: 5
    )
    @good_1 = @bakery_1.goods.create!(name: "Cinnamon Roll",
    category: "Pastry",
    days_old: 0,
    gluten_free: true,

  )
    @good_2 = @bakery_1.goods.create!(name: "Pumpkin Bread",
    category: "Bread",
    days_old: 1,
    gluten_free: true,

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

  it 'has a link that can show the goods sorted alphabetically' do
    visit "/bakeries/#{@bakery_1.id}/goods"

    expect(page).to have_link('Alpha Order')
    click_link('Alpha Order')
    expect(current_path).to eq("/bakeries/#{@bakery_1.id}/goods")
    expect(@good_1.name).to appear_before(@good_2.name)
  end
end
