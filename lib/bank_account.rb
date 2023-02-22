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

  # def get_statement
  #   statement_string = ""
  #   balance = 0

  #   @transactions.each do |transaction|
  #     transaction_string = ""
  #     transaction_string += "\n#{get_formatted_date(transaction.date)} || "
  #     if transaction.type == 'deposit'
  #       balance += transaction.amount
  #       transaction_string += "#{"%.2f" % transaction.amount} || || "
  #     else
  #       balance -= transaction.amount
  #       transaction_string += "|| #{"%.2f" % transaction.amount} || "
  #     end
  #     transaction_string += "#{"%.2f" % balance.to_s}"
  #     statement_string = transaction_string + statement_string 
  #   end

  #   statement_string = "DATE || CREDIT || DEBIT || BALANCE" + statement_string
  #   statement_string += "\n- No transactions available -" if @transactions.empty?

  #   return statement_string
  # end

  def get_statement
    statement_string = "DATE || CREDIT || DEBIT || BALANCE" + get_transactions_string()
    statement_string += "\n- No transactions available -" if @transactions.empty?

    return statement_string
  end

  private

  def get_transactions_string
    all_transactions_string = ""
    balance = 0

    @transactions.each do |transaction|
      transaction_string = ""
      transaction_string += "\n#{get_formatted_date(transaction.date)} || "
      if transaction.type == 'deposit'
        balance += transaction.amount
        transaction_string += "#{"%.2f" % transaction.amount} || || "
      else
        raise 'Operation not permitted' if transaction.amount > balance
        balance -= transaction.amount
        transaction_string += "|| #{"%.2f" % transaction.amount} || "
      end
      transaction_string += "#{"%.2f" % balance.to_s}"
      all_transactions_string = transaction_string + all_transactions_string 
    end

    return all_transactions_string
  end

  def get_formatted_date(date)
    formatted_date = date.strftime(("%d/%m/%Y"))
    return formatted_date
  end
end
