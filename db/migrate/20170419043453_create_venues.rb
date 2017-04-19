class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :url
      t.string :latitude
      t.string :longitude
    end
  end
end
