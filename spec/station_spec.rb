require "station"

describe Station do 
  let(:paddington) {Station.new("Paddington", 1)}

  describe ".initialize" do
    it "should have a name variable that is accessible" do
      expect(paddington.name).to eq("Paddington")
    end 
    
    it "should have a zone variable that is accesible" do 
      expect(paddington.zone).to eq(1)
    end 
  end
end 