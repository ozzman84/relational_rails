require 'rails_helper'

RSpec.describe 'parent name show', type: :feature do
  before :each do
    @master = Bed.create!(name: 'Master Bed', occupied: true, guest_count: 0)
    Guest.create!(bed: @master,first_name: 'Cruella',last_name: 'Deville',rent: 300,visiting: true)
    Guest.create!(bed: @master, first_name: 'Scar', last_name: 'Lionsmain', rent: 300, visiting: true)
    Guest.create!(bed: @master, first_name: 'Jafar', last_name: 'Skinnybeard', rent: 300, visiting: true)
    visit "/beds/#{@master.id}"
  end

  it 'renders parent, id & attributes' do
    # expect(page).to have_content(@master.id)
    expect(page).to have_content(@master.name)
    expect(page).to have_content(@master.occupied)
    expect(page).to have_content(@master.guest_count)
  end

  it 'returns count of parents children' do
    # expect(page).to have_selector(:first_name, count: 3)
    expect(@master.guests.count).to eq(3)
  end
end
