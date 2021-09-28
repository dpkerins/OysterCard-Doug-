class Journey 
  attr_writer :entry_station
  attr_writer :exit_station

  def initialize
    @entry_station = nil 
    @exit_station = nil
  end 

  def in_journey?
    @entry_station != nil
  end 

  def set_entry(station)
    @entry_station = station
  end

  def set_exit(station)
    @exit_station = station
  end 
end 