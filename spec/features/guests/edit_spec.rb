# [ ] done
#
# User Story 14, Child Update (x2)
#
# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
require 'rails_helper'

RSpec.describe 'Guest Edit' do
  before :each do
    @test_bed = Bed.create!(name: "test bed", occupied: true, guest_count: 0)
    @guest = Guest.create!(bed_id: @test_bed.id,first_name: 'Jon', last_name: 'Smith', rent: 300, visiting: true)
  end

  it 'links to Guest edit page from show page' do
    visit "/guests/#{@guest.id}"

    click_button "Edit"

    expect(current_path).to eq("/guests/#{@guest.id}/edit")
  end

  it 'can edit a Guest' do
    visit "/guests/#{@guest.id}"

    expect(page).to have_content('Jon')
    click_button "Edit"

    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Rent', with: 200
    fill_in 'Visiting', with: 'true'
    click_button "Update ID: #{@guest.id}"

    expect(current_path).to eq("/guests/#{@guest.id}")
    expect(page).to have_content("John")
  end
end
