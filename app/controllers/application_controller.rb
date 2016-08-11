class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :screenings
  include Comfy::CmsHelper
  def screenings
    screenings_data = @cms_page.children.find_by_slug('screenings').children
    length = screenings_data.length
    @screenings = Array.new(length) { Hash.new }
    screenings_data.each_with_index do |screening, i|
      @screenings[i] = {
        "city" => cms_block_content('city', screening),
        "date_and_time" => cms_block_content('date_and_time', screening),
        "country" => cms_block_content('country', screening),
        "eventbrite_link" => cms_block_content('eventbrite_link', screening),
        "venue_name" => cms_block_content('venue_name', screening),
        "address" => cms_block_content('address', screening)
      }
    end
    return @screenings
  end
end
