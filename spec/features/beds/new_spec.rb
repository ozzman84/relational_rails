# User Story 11, Parent Creation (x2)
#
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

require 'rails_helper'

RSpec.describe 'Bed creation page' do
  it 'links to new page form via parent index' do
    visit '/beds'

    click_link('New Bed')
    expect(current_path).to eq('/beds/new')
  end

  it 'can create a new bed' do
    visit '/beds/new'

    fill_in('Name', with: 'Test Master Bed')
    fill_in('Occupied', with: true)
    fill_in('Guest count', with: 0)
    click_button('Create Bed')

    expect(current_path).to eq("/beds")
    expect(page).to have_content('Test Master Bed')
  end
end
