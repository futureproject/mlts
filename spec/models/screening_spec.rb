require "rails_helper"

describe Screening, "#create" do

  context "when importing one screening" do
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

    it "geocodes address" do
      expect(Screening.last.latitude).to eq 46.6611307
      expect(Screening.last.longitude).to eq -120.5269052
    end
  end

  context "Bad data" do
    it "does not import a screening with nil values" do
      Screening.create({:screening_time=>"5/31/2017 18:00:00", :link=>nil, :venue_name=>nil, :street_address=>nil, :city=>nil, :state=>nil, :identifier=>"Screening 1, 4/27/2017 17:10:00"})
      expect(Screening.count).to eq 0
    end

    it "does not import a screening with empty string values" do
      Screening.create({:screening_time=>"5/31/2017 18:00:00", :link=>nil, :venue_name=>"", :street_address=>"", :city=>"", :state=>"", :identifier=>"Screening 1, 4/27/2017 17:10:00"})
      expect(Screening.count).to eq 0
    end

    it "does not import a screening with slightly wrong data" do
      Screening.create({:screening_time=>"5/31/2017 18:00:00", :link=>nil, :venue_name=>"Test venue", :street_address=>"30 Test Street", :city=>"", :state=>12345, :identifier=>"Screening 1, 4/27/2017 17:10:00"})
      expect(Screening.count).to eq 0
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
