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



end 