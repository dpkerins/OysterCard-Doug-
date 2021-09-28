class Journey 
  attr_reader :entry_station
  attr_reader :exit_station
  MIN_FARE = 1

  def initialize
    @entry_station = nil 
    @exit_station = nil
  end 

  # def in_journey?
  #   @entry_station != nil
  # end 

  def set_entry(station)
    @entry_station = station
  end

  def set_exit(station)
    @exit_station = station
  end

  def fare
    entry_station == nil || exit_station == nil ? 6 : 1
  end
end