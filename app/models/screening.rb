class Screening < ActiveRecord::Base
  validates :screening_time, :uniqueness => true
  geocoded_by :full_street_address
  after_validation :geocode

  private
  def full_street_address
    if country?
      street_address.strip + ', ' + city + ', ' + country
    else
      street_address.strip + ', ' + city
    end
  end
end
