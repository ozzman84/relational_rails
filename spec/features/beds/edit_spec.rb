# User Story 12, Parent Update (x2)
#
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require 'rails_helper'

RSpec.describe 'Bed edit' do
  it 'links to the edit page' do
    test_bed = Bed.create!(name: "test bed", occupied: true, guest_count: 0)

    visit '/beds'

    click_button "Edit #{test_bed.name}"

    expect(current_path).to eq("/beds/#{test_bed.id}/edit")
  end

  it 'can edit a Bed' do
    test_bed = Bed.create!(name: "test bed", occupied: true, guest_count: 0)

    visit "/beds"

    expect(page).to have_content('test bed')

    click_button "Edit #{test_bed.name}"

    fill_in 'name', with: 'Test Master Bed'
    click_button "Update #{test_bed.name}"

    expect(current_path).to eq("/beds")
    expect(page).to have_content("Test Master Bed")
  end
end
