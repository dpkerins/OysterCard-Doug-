require "station"

describe Station do 
  it "should have a name variable that is accessible" do 
    expect(subject.name).to be_a String
  end 
  
  it "should have a zone variable that is accesible" do 
    expect(subject.zone).to be_a Integer
  end 
end 