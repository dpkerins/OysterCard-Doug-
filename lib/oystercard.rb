class Oystercard
  attr_reader :balance
  attr_reader :limit

  DEFAULT_LIMIT = 90
  MIN_BALANCE = 1

  def initialize(balance = 0, limit = DEFAULT_LIMIT)
    @balance = balance
    @limit = limit
    @in_journey = false 
  end 

  def top_up(money)
    raise "You have reached your #{@limit} pound limit" if exceed_limit(money)
    @balance += money
  end

  def in_journey? 
    @in_journey
  end

  def touch_in
    raise "Minimum balance for a single journey is £#{MIN_BALANCE}" if @balance < 1
    @in_journey = true 
  end 

  def touch_out
    deduct(MIN_BALANCE)
    @in_journey = false 
  end 

  private

  def exceed_limit(money)
    (@balance + money ) > @limit
  end

  def deduct(money)
    @balance -= money
  end

end
