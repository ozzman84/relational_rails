# User Story 13, Parent Child Creation (x2)
#
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
require 'rails_helper'

RSpec.describe 'Bed Guest creation page' do
  before :each do
    @test_bed = Bed.create!(name: "test bed", occupied: true, guest_count: 0)
  end

  it 'links to new page form via parent child index' do
    visit "beds/#{@test_bed.id}/guests"

    click_link('Create Guest')
    expect(current_path).to eq("/beds/#{@test_bed.id}/guests/new")
  end

  it 'can create a new bed guest' do
    visit "/beds/#{@test_bed.id}/guests/new"

    fill_in('First name', with: 'John')
    fill_in('Last name', with: 'Smith')
    fill_in('Rent', with: 0)
    fill_in('Visiting', with: true)
    click_button('Create Guest')

    expect(current_path).to eq("/beds/#{@test_bed.id}/guests")
    expect(page).to have_content("John")
  end
end
