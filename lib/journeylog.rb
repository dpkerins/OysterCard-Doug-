class JourneyLog 
  attr_reader :logs, :journey

  def initialize(journey_class= Journey)
    @logs = []
    @journey_class = journey_class
    new_journey
  end

  def start(station)
    log_journey if current_journey == @journey && !@journey.entry_station.nil?
    new_journey
    @journey.entry_station = station
  end

  def new_journey
    @journey = @journey_class.new
  end

  def return_fare
    @journey.fare
  end

  def finish(station)
    @journey.exit_station = station
    log_journey
  end

  def journeys
    @logs.dup.freeze
  end


  private

    def current_journey
      @journey if @journey.entry_station.nil? && !@journey.exit_station.nil?
      @journey if !@journey.entry_station.nil? && @journey.exit_station.nil?
      new_journey
    end

    def log_journey
      @logs << @journey
    end

end

