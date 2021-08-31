# User Story 15, Child Index only shows `true` Records (x2)
#
# As a visitor
# When I visit the child index
# Then I only see records where the boolean column is `true`
require 'rails_helper'

RSpec.describe 'parents chidren index' do
  before :each do
    @bed    = Bed.create!(name: 'Master Bed', occupied: true, guest_count: 0)
    @hook   = Guest.create!(bed_id: @bed.id, first_name: 'Captain', last_name: 'Hook', rent: 300, visiting: true)
    @gaston = Guest.create!(bed_id: @bed.id, first_name: 'Gaston', last_name: 'Hunterson', rent: 300, visiting: true)
    @scar   = Guest.create!(bed_id: @bed.id, first_name: 'Scar', last_name: 'Lionsmain', rent: 300, visiting: false)
    @bed2   = Bed.create!(name: 'Other Bed', occupied: true, guest_count: 2)
    @jafar  = Guest.create!(bed_id: @bed2.id, first_name: 'Jafar', last_name: 'Skinnybeard', rent: 300, visiting: true)
  end

  it 'returns all children of the one parent with attributes' do
    visit "/beds/#{@bed.id}/guests"

    expect(page).to have_content(@hook.first_name)
    expect(page).to have_content(@hook.last_name)
    expect(page).to have_content(@hook.rent)
    expect(page).to have_content(@hook.visiting)
    #add another guest for tests

    expect(page).not_to have_content(@jafar.first_name)
    expect(page).not_to have_content(@jafar.first_name)
  end

  it 'returns only children that have true values for visiting' do
    visit "/beds/#{@bed.id}/guests"

    expect(page).to have_content(@hook.first_name)
    expect(page).to have_content(@hook.last_name)
    expect(page).to have_content(@hook.rent)
    expect(page).to have_content(@hook.visiting)

    expect(page).not_to have_content(@jafar.first_name)
    expect(page).not_to have_content(@scar.first_name)
  end

  it 'returns Bed Guests in alfabetical order when selected' do
    visit "/beds/#{@bed.id}/guests"

    click_link('Sort Alfabetically')

    expect('Captain').to appear_before('Gaston')
  end
end
