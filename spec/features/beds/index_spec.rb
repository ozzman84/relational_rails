require 'rails_helper'

RSpec.describe "Parents name index", type: :feature do
  before :each do
    @master = Bed.create!(name: 'Master Bed', occupied: true, guest_count: 0)
    @bed2   = Bed.create!(name: 'Other Bed', occupied: true, guest_count: 2)
  end

  it 'returns all parent index names' do
    visit '/beds'

    expect(page).to have_content(@master.name)
    expect(page).to have_content(@bed2.name)
  end

  it 'returns parents sorted by recently created' do
    visit '/beds'

    expect(@master.name).to appear_before(@bed2.name)
  end
end
