class Venue < ActiveRecord::Base
  validates :name, uniqueness: true
end
