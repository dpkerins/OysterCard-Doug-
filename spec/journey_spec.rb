require "journey"

describe Journey do

  let(:oystercard) { double("oystercard") }
  let(:richmond) { double("station", :zone => 4) }
  let(:victoria) { double("station 2", :zone => 1) }
  let(:paddington) { double("station 3", :zone => 1) }
  

  describe ".current_journey" do

    it "should store touch in station in entry_station variable" do
      subject.add_entry_station(richmond)
      expect(subject.entry_station).to(eq(richmond))
    end

    it "should store touch out station in exit_station variable" do
      subject.add_exit_station(victoria)
      expect(subject.exit_station).to(eq(victoria))
    end
  end 

  describe ".fare" do
    it "should return £4 fare if journey includes entry and exit stations" do
      subject.add_entry_station(richmond)
      subject.add_exit_station(paddington)
      expect(subject.fare).to(eq(4))
    end

    it "should return £2 fare if journey includes entry and exit stations" do
      subject.add_entry_station(victoria)
      subject.add_exit_station(paddington)
      expect(subject.fare).to(eq(1))
    end

    it "shoud return penalty fare if entry is missing" do
      subject.add_exit_station(victoria)
      expect(subject.fare).to(eq(6))
    end

    it "shoud return penalty fare if exit is missing" do
      subject.add_entry_station(richmond)
      expect(subject.fare).to(eq(6))
    end
  end
  
end
