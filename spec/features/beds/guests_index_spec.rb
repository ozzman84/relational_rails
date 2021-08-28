require 'rails_helper'

RSpec.describe 'parents chidren index' do
  before :each do
    @bed   = Bed.create!(name: 'Master Bed', occupied: true, guest_count: 0)
    @hook  = Guest.create!(bed_id: @bed.id, first_name: 'Captain', last_name: 'Hook', rent: 300, visiting: true)
    @bed2  = Bed.create!(name: 'Other Bed', occupied: true, guest_count: 2)
    @jafar = Guest.create!(bed_id: @bed2.id, first_name: 'Jafar', last_name: 'Skinnybeard', rent: 300, visiting: true)

  end

  it 'returns all children of the one parent with attributes' do
    visit "/beds/#{@bed.id}/guests"

    expect(page).to have_content(@hook.first_name)
    expect(page).to have_content(@hook.last_name)
    expect(page).to have_content(@hook.rent)
    expect(page).to have_content(@hook.visiting)
    #add another guest for tests

    expect(page).not_to have_content(@jafar.first_name)
  end
end
