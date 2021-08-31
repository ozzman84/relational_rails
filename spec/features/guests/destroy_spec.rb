# User Story 20, Child Delete (x2)
#
# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child
require 'rails_helper'

RSpec.describe 'Guest destroy funtion' do
  before :each do
    @master = Bed.create!(name: 'Master Bed', occupied: true, guest_count: 0)
    @scar = Guest.create!(bed: @master, first_name: 'Scar', last_name: 'Lionsmain', rent: 300, visiting: true)
  end

  it 'can delete a Guest from the show page' do
    visit "/guests/#{@scar.id}"
    click_button 'Delete'

    expect(current_path).to eq('/guests')
    expect(page).to_not have_content('Scar')
  end
end
