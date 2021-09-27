class Oystercard
  attr_reader :balance, :limit, :entry_station, :journeys, :exit_station, :current_journey

  DEFAULT_LIMIT = 90
  MIN_BALANCE = 1

  def initialize(balance = 0, limit = DEFAULT_LIMIT)
    @balance = balance
    @limit = limit
    @entry_station = nil 
    @exit_station = nil
    @journeys = []
    @current_journey = {:entry => nil, :exit => nil}
    #create a hash called current_journey. on touch push the entry station to entry key. 
      #on touch out pushes exit station to exit key
  end 

  def top_up(money)
    raise "You have reached your #{@limit} pound limit" if exceed_limit(money)
    @balance += money
  end

  def in_journey? 
    @entry_station != nil
  end

  def touch_in(station)
    raise "Minimum balance for a single journey is £#{MIN_BALANCE}" if @balance < 1
    @entry_station = station
    @current_journey[:entry] = station
  end 

  def touch_out(station)
    deduct(MIN_BALANCE)
    @entry_station = nil
    @exit_station = station
    @current_journey[:exit] = station
    @journeys << @current_journey
  end 

  private

  def exceed_limit(money)
    (@balance + money ) > @limit
  end

  def deduct(money)
    @balance -= money
  end

end
