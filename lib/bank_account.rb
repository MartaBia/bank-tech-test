require_relative './transaction'

class BankAccount
  def initialize(transactions)
    @transactions = transactions
  end

  def deposit(amount)
    date = DateTime.now
    deposit = Transaction.new(date, 'deposit', amount)
    @transactions.push(deposit)
  end

  def withdraw(amount)
    date = DateTime.now
    withdrawal = Transaction.new(date, 'withdrawal', amount)
    @transactions.push(withdrawal)
  end

  def get_statement
    transaction_string = "DATE || CREDIT || DEBIT || BALANCE\n"
    transaction_string += "- No transactions available -" if @transactions.empty?
    balance = 0

    @transactions.each do |transaction|
      transaction_string += "#{get_formatted_date(transaction.date)} || "
      if transaction.type == 'deposit'
        balance += transaction.amount
        transaction_string += "#{"%.2f" % transaction.amount} || || "
      end
      transaction_string += "%.2f" % balance.to_s
    end

    return transaction_string
  end

  private

  def get_formatted_date(date)
    formatted_date = date.strftime(("%d/%m/%Y"))
    return formatted_date
  end
end
