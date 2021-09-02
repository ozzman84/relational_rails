require 'rails_helper'

RSpec.describe "goods index page" do
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
  @good_2 = @bakery_1.goods.create!(name: "Bread",
  category: "Bread",
  days_old: 0,
  gluten_free: false,
)

end

it 'can see all the goods in the index' do
  visit "/goods"
  expect(page).to have_content(@good_1.name)
  expect(page).to have_content(@good_1.category)
  expect(page).to have_content(@good_1.days_old)
  expect(page).to have_content(@good_1.gluten_free)
  expect(page).to have_content(@good_1.bakery_id)
  expect(page).to have_content(@good_1.created_at)
  expect(page).to have_content(@good_1.updated_at)
  end

  it 'has a link to the goods show page' do
    visit '/goods'
    expect(page).to have_link("#{@good_1.name}")
    click_link("#{@good_1.name}")
    expect(current_path).to eq("/goods/#{@good_1.id}")
  end

   it "only shows goods that have true for gluten free" do
     visit "/goods"
     expect(page).to have_content(@good_1.name)
     expect(page).to have_no_content(@good_2.name)
   end

   it 'can be redirected to from any page' do
     visit "/bakeries"
     expect(page).to have_link("All Goods")

     visit "/bakeries/#{@bakery_1.id}"
     expect(page).to have_link("All Goods")

     visit "/goods"
     expect(page).to have_link("All Goods")

     visit "/goods/#{@good_1.id}"
     expect(page).to have_link("All Goods")

     visit "/bakeries/##{@bakery_1.id}/goods"
     expect(page).to have_link("All Goods")
   end


  it 'has a link to edit the child for each good' do
    visit '/goods'
    expect(has_link?("Update #{@good_1.name}")).to eq(true)
    click_link("Update #{@good_1.name}")
    expect(current_path).to eq("/goods/#{@good_1.id}/edit")
  end
  it 'has a link to delete the good for each good' do
    visit '/goods'
    expect(has_link?("Delete #{@good_1.name}")).to eq(true)
    click_link("Delete #{@good_1.name}")
    expect(current_path).to eq("/goods")
    expect(page).to_not have_content(@good_1.name)
  end
end
