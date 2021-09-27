require "oystercard"

describe Oystercard do 

  it "should have a balance of zero by default on initialisation" do
    expect(subject.balance).to(eq(0))
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
=begin
  describe ".deduct" do 
    it "should allow user to have their fare deducted from their card" do 
      subject.top_up(30)
      subject.deduct(10)
      expect(subject.balance).to(eq(20))
    end
  end
=end 
  describe ".in_journey?" do 
    it "should return a boolean value for whether in_journey is true or false" do 
      expect([true, false]).to(include(subject.in_journey?))
    end
  end

  describe ".touch_in" do 
    it "should set in_journey to true" do 
      subject.top_up(20)
      subject.touch_in
      expect(subject.in_journey?).to(eq(true))
    end

    it "should raise an error if a users touches in with an insufficient balance" do 
      expect{subject.touch_in}.to(raise_error("Minimum balance for a single journey is £1"))
    end 
  end

  describe ".touch_out" do 
    it "should set in_journey to false" do 
      subject.touch_out
      expect(subject.in_journey?).to(eq(false))
    end

    it "should reduce the balance by the minimum fare" do
      subject.top_up(20)
      expect{subject.touch_out}.to change{subject.balance}.by(-1)
    end
  end
end 