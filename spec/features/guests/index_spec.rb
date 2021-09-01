require 'rails_helper'

RSpec.describe 'child name & attribute show', type: :feature do
  before :each do
    @bed = Bed.create!(name: 'Master Bed', occupied: true, guest_count: 0)
    @hook = Guest.create!(bed_id: @bed.id,first_name: 'Captain', last_name: 'Hook', rent: 300, visiting: true)
  end

  it 'returns children with attributes' do
    visit '/guests'

    expect(page).to have_content(@hook.first_name)
    expect(page).to have_content(@hook.last_name)
    expect(page).to have_content(@hook.rent)
    expect(page).to have_content(@hook.visiting)
  end

  it 'contains link to edit each Guest' do
    visit "/guests"

    click_button "Edit #{@hook.first_name}"

    expect(current_path).to eq("/guests/#{@hook.id}/edit")
  end

  it 'contains link to delete each Guest' do
    visit "/guests"

    click_button "Delete #{@hook.first_name}"

    expect(current_path).to eq("/guests")
  end
end
