require "oystercard"

describe Oystercard do 

  let(:richmond) { double("station", :zone => 4) }
  let(:victoria) { double("station 2", :zone => 1) }
  let(:paddington) { double("station 3", :zone => 1) }

  describe ".initialize" do
    it "should have a balance of zero by default on initialisation" do
      expect(subject.balance).to(eq(0))
    end
  end

  describe ".top_up" do
    it "should allow user to add money to balance with .top_up" do
      subject.top_up(15)
      expect(subject.balance).to(eq(15))
    end

    it "should raise an error when trying to top up past the balance limit" do
      expect { subject.top_up(91) }.to(raise_error("You have reached your 90 pound limit"))
    end
  end

  describe ".touch_in" do 
    let(:station) { double("station") }

    it "should raise an error if a users touches in with an insufficient balance" do 
      expect { subject.touch_in(station) }.to(raise_error("Minimum balance for a single journey is £1"))
    end
  end

  describe ".touch_out" do  
    it "should reduce the balance by the minimum fare" do
      subject.top_up(20)
      subject.touch_in(victoria)
      expect { subject.touch_out(paddington) }.to change { subject.balance }.by(-1)
    end
  end
end
