class Screening < ActiveRecord::Base
  validates_uniqueness_of :identifier, :allow_blank => true
  validates :street_address, :city, :state, presence: true
  after_validation :geocode, if: ->(screening){screening.street_address.present? && screening.city.present? && screening.state.present?}
  geocoded_by :full_street_address

  def map_label
    label_html = "<h2>#{city}, #{state}</h2>
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
      street_address + ', ' + city + ', ' + state + ', ' + country
    else
      street_address + ', ' + city + ', ' + state
    end
  end
end
