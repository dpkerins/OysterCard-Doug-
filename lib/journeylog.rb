class JourneyLog 
  attr_reader :logs, :journey
  def initialize(journey_class= Journey)
    @logs = []
    @journey_class = journey_class
    @journey = journey_class.new
  end



  def start(station)
    #if current journey is incomplete 
    #return incomplete journey
    #elsif current journey is nil
    #create a new journey 
    
    journey.entry_station = station
    current_journey
  end

  

  def current_journey
    if @journey.entry_station != nil && @journey.exit_station != nil
      push(@journey)
      @journey = @journey.new
    elsif @journey.entry_station == nil && @journey.exit_station != nil
      @journey
    elsif @journey.entry_station != nil && @journey.exit_station == nil
      @journey
    end
  end 

  def finish(station)
    @journey.exit_station = station 
    current_journey
    
  end




private 
  def push(journey)
    @logs << journey
  end 
end 