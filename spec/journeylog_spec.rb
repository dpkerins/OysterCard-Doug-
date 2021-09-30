require "journeylog"

describe JourneyLog do 
  let(:richmond) {double("station", :zone => 4)}
  let(:victoria) {double("station 2", :zone => 1)}
  let(:paddington) {double("station 3", :zone => 1)}

  describe ".initialize" do
    it "should have an empty list of previous journeys on initialization" do
      expect(subject.logs).to(eq([]))
    end
  end

  describe ".start" do 
    it "should create a new instance of the journey class" do 
      subject.start(richmond)
      expect(subject.journey).to be_a Journey
    end

    it "should store the entry station to a instance variable within the journey object" do 
      subject.start(richmond)
      expect(subject.journey.entry_station).to eq(richmond)
    end
  end

  describe ".finish" do 
    it "should add an exit station to the current journey" do 
      subject.finish(victoria)
      expect(subject.journey.exit_station).to eq(victoria)
    end
  end

  describe ".journeys" do
    it "should return a duplicate version of the logs array (previous journeys)" do
      journey_class = double(:journey_class)
      journey1 = double("journey1 double", entry_station: richmond, exit_station: victoria, :add_entry_station => richmond, :add_exit_station => victoria)
      journey2 = double("journey2 double", entry_station: victoria, exit_station: richmond, :add_entry_station => victoria, :add_exit_station => richmond)
      allow(journey_class).to receive(:new).and_return(journey1)
      journeylog = JourneyLog.new(journey_class)
      journeylog.start(richmond)
      allow(journey_class).to receive(:new).and_return(journey2)
      journeylog.start(victoria)
      expect(journeylog.journeys).to eq([journey1, journey2])
    end
  end
  

end 