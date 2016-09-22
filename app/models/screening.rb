class Screening < ActiveRecord::Base
  validates :screening_time, :uniqueness => true
  geocoded_by :full_street_address
  after_validation :geocode

  def map_label
    label_html = "<h2>#{city}</h2>
    <p>#{screening_time.strftime('%A, %B %e at %l:%M %p')}</p>
    <p>#{venue_name}</p>
    <p>#{street_address}</p>
    "
    if link?
      label_html = label_html + "<p><a href=#{link}>RSVP</a></p>"
    end
    label_html
  end

  private
  def full_street_address
    if country?
      street_address.strip + ', ' + city + ', ' + country
    else
      street_address.strip + ', ' + city
    end
  end
end
