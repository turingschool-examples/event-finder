require 'csv'

Venue.destroy_all

csv_text = File.read(Rails.root.join('db', 'csv', 'venues.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  venue = Venue.new(row.to_h)
  if venue.save
    puts "#{venue.name} successfully created."
  end
end
