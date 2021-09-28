require "oystercard"

describe Oystercard do 

  it "should have a balance of zero by default on initialisation" do
    expect(subject.balance).to(eq(0))
  end

  it "should have an empty list of journeys on initialization" do
    expect(subject.journeys).to(eq([]))
  end

  describe ".top_up" do
    it "should allow user to add money to balance with .top_up" do
      subject.top_up(15)
      expect(subject.balance).to(eq(15))
    end

    it "should raise an error when trying to top up past the balance limit" do
      expect{subject.top_up(91)}.to(raise_error("You have reached your 90 pound limit"))
    end
  end

  describe ".touch_in" do 
    let(:station) {double("station")}

    it "should raise an error if a users touches in with an insufficient balance" do 
      expect{subject.touch_in(station)}.to(raise_error("Minimum balance for a single journey is £1"))
    end
  end

  describe ".touch_out" do 
    let(:station) {double("station")}
    let(:station2) {double("station 2")}

    it "should reduce the balance by the minimum fare" do
      subject.top_up(20)
      subject.touch_in(station)
      expect{subject.touch_out(station2)}.to change{subject.balance}.by(-1)
    end

    it "should push current_journey hash to journeys array" do
      subject.top_up(20)
      subject.touch_in(station)
      subject.touch_out(station2)
      expect(subject.journeys[0]).to(eq(subject.current_journey))
    end
  end
end 