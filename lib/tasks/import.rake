require 'rake'
namespace :import do
  desc 'Import screenings from a xlsx'
  task :screenings => :environment do
    xlsx = Roo::Spreadsheet.open('xlsx/screenings.xlsx')
    xlsx = Roo::Excelx.new("xlsx/screenings.xlsx")
    sheet = xlsx.sheet(0)
    data = sheet.parse(screening_time: 'Screening Date and Time', link: 'Link', venue_name: 'Venue Name', street_address: 'Street Address', city: 'City', state: 'State', identifier: 'Identifier')
    puts data

    Screening.create(data)
  end
end

require 'roo'
