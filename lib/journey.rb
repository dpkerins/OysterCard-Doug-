class Journey 
  attr_reader :entry_station, :exit_station
  MIN_FARE = 1

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def fare
    return 0 if @entry_station.nil? && @exit_station.nil?
    return 6 if @entry_station.nil? || @exit_station.nil?
    MIN_FARE + (@entry_station.zone - @exit_station.zone).abs()
  end

  def add_entry_station(station)
    @entry_station = station
  end

  def add_exit_station(station)
    @exit_station = station
  end

end
