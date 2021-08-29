require 'rails_helper'

RSpec.describe 'create a bakery' do
  it 'links to the new page from bakery index' do
    visit '/bakeries'

    expect(page).to have_link('New Bakery')
    click_link('New Bakery')
    expect(current_path).to eq('/bakeries/new')
  end

  it 'creates a new bakery' do
    visit '/bakeries/new'
    fill_in('name', with: 'Sugar Bakeshop')
    fill_in('city', with: 'Denver')
    fill_in('delivery', with: true)
    fill_in('review', with: 5)
    click_button 'Create Bakery'

    
  end
end
