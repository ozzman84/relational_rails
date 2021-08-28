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
end
