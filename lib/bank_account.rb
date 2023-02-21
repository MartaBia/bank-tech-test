class BankAccount
  def initialize(transactions)
    @transactions = transactions
  end

  def deposit(amount)
    date = DateTime.now
    deposit = Transaction.new(date, 'deposit', amount)
    @transactions.push(deposit)
  end

  def withdrawal(amount)
    date = DateTime.now
    withdrawal = Transaction.new(date, 'withdrawal', amount)
    @transactions.push(withdrawal)
  end

  def get_statement
    transaction_string = "DATE || CREDIT || DEBIT || BALANCE\n"
    transaction_string += "- No transactions available -" if @transactions.empty?
  end

  private

  def get_formatted_date(date)
    formatted_date = date.strftime(("%d/%m/%Y"))
    return formatted_date
  end
end
