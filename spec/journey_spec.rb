require "journey"

describe Journey do 

  describe ".in_journey?" do 
    it "should return a boolean value for whether in_journey is true or false" do 
      expect([true, false]).to(include(subject.in_journey?))
    end
  end 

  context "current_journey" do
    let(:oystercard) {double("oystercard")}

  it "should store touch in station in entry_station variable" do
    oystercard.touch_in(station)
    expect(subject.entry_station).to(eq(station))
  end

  it "should store entry station variable to entry key in current_journey" do
    subject.top_up(20)
    subject.touch_in(station)
    expect(subject.current_journey[:entry]).to(eq(station))
  end

  it "should set entry_station variable to nil" do
    subject.top_up(20)
    subject.touch_in(station)
    subject.touch_out(station2)
    expect(subject.entry_station).to(eq(nil))
  end

  it "should store touch out station in exit_station variable" do
    subject.top_up(20)
    subject.touch_in(station)
    subject.touch_out(station2)
    expect(subject.exit_station).to(eq(station2))
  end

  it "should store exit station variable to exit key in current_journey" do
    subject.top_up(20)
    subject.touch_in(station)
    subject.touch_out(station2)
    expect(subject.current_journey[:exit]).to(eq(station2))
  end
end 
end