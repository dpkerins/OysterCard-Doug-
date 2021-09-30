require "journeylog"

describe JourneyLog do 
  let(:station) {double("station")}
  let(:station2) {double("station 2")}

  it "should hold an array of journey objects" do 
    expect(subject.logs).to eq([])
  end

  describe ".start" do 
    it "should create a new instance of the journey class" do 
      subject.start(station)
      expect(subject.journey).to be_a Journey
    end

    it "should store the entry station to a instance variable within the journey object" do 
      subject.start(station)
      expect(subject.journey.entry_station).to eq(station)
    end

    it "should create a new instance of a journey class" do 
      subject.current_journey
      expect(subject.journey.entry_station).to eq(nil)
    end 

    it "should return the current journey object if either it's entry or exit station are missing" do 
      subject.start(station)
      subject.current_journey
      expect(subject.journey.entry_station).to eq(station)
    end
  end

  describe ".finish" do 
    it "should add an exit station to the current journey" do 
      subject.finish(station2)
      expect(subject.journey.exit_station).to eq(station2)
    end
  end
  

end 