# User Story 19, Parent Delete (x2)
#
# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent
require 'rails_helper'

RSpec.describe 'destroying an artist' do
  before :each do
    @bed2   = Bed.create!(name: 'Other Bed', occupied: true, guest_count: 2)
  end

  it 'can delete the artist from the Bed show page' do
    visit "/beds/#{@bed2.id}"
    click_button 'Delete'

    expect(current_path).to eq('/beds')
    expect(page).to_not have_content('Other Bed')
  end
end
