class Oystercard
  attr_reader :balance, :limit, :current_journey, :journeylog

  DEFAULT_LIMIT = 90
  MIN_BALANCE = 1

  def initialize(balance = 0, limit = DEFAULT_LIMIT, journeylog_class = JourneyLog)
    @balance = balance
    @limit = limit
    @journeylog = journeylog_class.new  
  end 

  def top_up(money)
    raise "You have reached your #{@limit} pound limit" if exceed_limit(money)
    @balance += money
  end

  def touch_in(station)
    raise "Minimum balance for a single journey is £#{MIN_BALANCE}" if @balance < 1
    deduct(@journeylog.return_fare)
    @journeylog.start(station)
  end 

  def touch_out(station)
    @journeylog.finish(station)
    deduct(@journeylog.return_fare)
    @journeylog.new_journey
  end
  
  private

  def exceed_limit(money)
    (@balance + money) > @limit
  end

  def deduct(fare)
    @balance -= fare
  end

end
