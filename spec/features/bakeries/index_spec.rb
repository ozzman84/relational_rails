require 'rails_helper'
#remove before each

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
    @good_1 = @bakery_2.goods.create!(name:"Choc Cookie", category: "Cookie",
    days_old: 0, gluten_free: true,)
  end
  it "can see all names of the parent index" do

    visit "/bakeries"
    expect(page).to have_content(@bakery_1.name)
    expect(page).to have_content(@bakery_2.name)
  end

  it 'has a link to the bakeries show page' do
    visit '/bakeries'
    expect(page).to have_link("#{@bakery_1.name}")
    click_link("#{@bakery_1.name}")
    expect(current_path).to eq("/bakeries/#{@bakery_1.id}")
  end

  it 'sorts by most recently created' do
    visit '/bakeries'
    expect(@bakery_2.name).to appear_before(@bakery_1.name)
  end

  it 'can be redirected to from any page' do
    visit '/bakeries'
    expect(page).to have_link('All Bakery')

    visit "/bakeries/#{@bakery_1.id}"
    expect(page).to have_link('All Bakery')

    visit "/goods"
    expect(page).to have_link('All Bakery')

    visit "/goods/#{@good_1.id}"
    expect(page).to have_link('All Bakery')

    visit "/bakeries/#{@bakery_1.id}/goods"
    expect(page).to have_link('All Bakery')
  end

  it 'has a link to update each bakery' do
    visit '/bakeries'
    expect(has_link?("Update #{@bakery_1.name}")).to eq(true)

    click_link("Update #{@bakery_1.name}")
    expect(current_path).to eq("/bakeries/#{@bakery_1.id}/edit")
  end

  it 'has a link to delete each bakery' do
    visit '/bakeries'
    expect(has_link?("Delete #{@bakery_1.name}")).to eq(true)
    click_link("Delete #{@bakery_1.name}")
    expect(current_path).to eq("/bakeries")
    expect(page).to_not have_content(@bakery_1.name)
  end
end
