require 'rails_helper'

RSpec.describe "Event Finder API", :type => :request do

  it "returns events by zip code" do
    visit '/'

    fill_in "q",  with: "80202"
    click_button("Find Events")
    expect(current_path).to eq('/search')

    expect(page).to have_content("16 Events for March")
  end
end
