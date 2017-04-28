require "rails_helper"

describe Screening, "#create" do

  context "importing a screening" do
    before do
      Screening.create({:screening_time=>"Wed, 31 May 2017 18:30:00 +0000", :link=>nil, :venue_name=>"Selah Middle School - VPAC  ", :street_address=>"411 N. 1st Street", :city=>"Selah", :state=>"WA", :identifier=>"Screening 1, 3/13/2017 13:30:00"})
    end

    it "saves to the database" do
      imported_screening=Screening.last
      expect(Screening.count).to eq 1
    end

    it "sets the screening time" do
      expect(Screening.last.screening_time).to eq "Wed, 31 May 2017 18:30:00"
    end

    it "geocodes" do
      expect(Screening.last.latitude).to eq 46.6611307
      expect(Screening.last.longitude).to eq -120.5269052
    end
  end

  context "importing multiple screenings" do

    it "enforces uniqueness of the identifier field" do
      data = [
        {:screening_time=>"Wed, 31 May 2017 18:30:00 +0000", :link=>nil, :venue_name=>"Selah Middle School - VPAC  ", :street_address=>"411 N. 1st Street", :city=>"Selah", :state=>"WA", :identifier=>"Screening 1, 3/13/2017 13:30:00"},
        {:screening_time=>"Wed, 31 May 2017 18:30:00 +0000", :link=>nil, :venue_name=>"Selah Middle School - VPAC  ", :street_address=>"411 N. 1st Street", :city=>"Selah", :state=>"WA", :identifier=>"Screening 1, 3/13/2017 13:30:00"}
      ]
      Screening.create(data)
      expect(Screening.count).to eq 1
    end

  end

end
