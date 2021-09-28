class Oystercard
  attr_reader :balance, :limit, :entry_station, :journeys, :exit_station, :current_journey

  DEFAULT_LIMIT = 90
  MIN_BALANCE = 1

  def initialize(balance = 0, limit = DEFAULT_LIMIT)
    @balance = balance
    @limit = limit
    @journeys = []
    
  end 

  def top_up(money)
    raise "You have reached your #{@limit} pound limit" if exceed_limit(money)
    @balance += money
  end

  def touch_in(station, journey=Journey.new)
    raise "Minimum balance for a single journey is £#{MIN_BALANCE}" if @balance < 1
    @current_journey = journey
    @current_journey.set_entry(station)
  end 

  def touch_out(station)
    deduct(MIN_BALANCE)
    @current_journey.set_exit(station)
  end 

  def log_journey
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
