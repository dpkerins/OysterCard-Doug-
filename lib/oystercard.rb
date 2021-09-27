class Oystercard
  attr_reader :balance
  attr_reader :limit

  DEFAULT_LIMIT = 90

  def initialize(balance = 0, limit = DEFAULT_LIMIT)
    @balance = balance
    @limit = limit
  end 

  def top_up(money)
    raise "You have reached your #{@limit} pound limit" if exceed_limit(money)
    @balance += money
  end

  private

  def exceed_limit(money)
    (@balance + money ) > @limit
  end

end
