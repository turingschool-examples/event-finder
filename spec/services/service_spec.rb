describe "Service" do
  events = Service.get_events(80202)
  event = event.first

  expect(events).to be_a(Array)
  expect(events.count).to eq(16)
  expect(event).to be_a(Hash)
  expect(event).to have_key(title)
  expect(event).to have_key(start_time)
  expect(event).to have_key(descripton)
  expect(event).to have_key(venue_name)
  expect(event).to have_key(venue_address)
end
