class Transaction
  def initialize(date, type, amount)
    @date = date
    @type = type
    @amount = amount
  end

  def date
    return @date
  end

  def type
    return @type
  end

  def amount
    return @amount
  end
end
