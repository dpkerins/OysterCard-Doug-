require "journey"

describe Journey do 

  let(:oystercard) {double("oystercard")}
  let(:station) {double("station")}
  let(:station2) {double("station 2")}

  # it "should set in_journey to true" do 
  #   subject.top_up(20)
  #   subject.touch_in(station)
  #   expect(subject.in_journey?).to(eq(true))
  # end

  # describe ".in_journey?" do 
  #   it "should return a boolean value for whether in_journey is true or false" do 
  #     expect([true, false]).to(include(subject.in_journey?))
  #   end
  # end 

  # it "should set in_journey to false" do 
  #   subject.touch_out(station2)
  #   expect(subject.in_journey?).to(eq(false))
  # end

  context "current_journey" do

    it "should store touch in station in entry_station variable" do
      subject.set_entry(station)
      expect(subject.entry_station).to(eq(station))
    end

    it "should store touch out station in exit_station variable" do
      subject.set_exit(station2)
      expect(subject.exit_station).to(eq(station2))
    end
  end 

  it "should return fare if journey includes entry and exit stations" do
    subject.set_entry(station)
    subject.set_exit(station2)
    expect(subject.fare).to(eq(1))
  end

  it "shoud return penalty fare if entry is missing" do
    subject.set_exit(station2)
    expect(subject.fare).to(eq(6))
  end

  it "shoud return penalty fare if exit is missing" do
    subject.set_entry(station)
    expect(subject.fare).to(eq(6))
  end
  
end