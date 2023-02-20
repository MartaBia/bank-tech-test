class BankFormatter
  def initialize(io, bank_manager)
    @io = io
    @bank_manager = bank_manager
  end

  def run
    print_header
    process
  end

  private

  def print_header
    @io.puts 'Welocme, please select one of the following options:'
    @io.puts ''
    @io.puts '1 - Deposit'
    @io.puts '2 - Withdrawal'
    @io.puts '3 - Bank statement'
    @io.puts '9 - Exit'
  end

  def process
    user_input = @io.gets.chomp
    raise 'A number must be inserted' if user_input.empty?

    case user_input
    when '9'
      @io.puts 'Thank you, goodbye!'
    else
      @io.puts "Invalid input.\nPlease, select a number between 1 and 3, or number 9 to exit"
    end
  end
end

if __FILE__ == $0
  bank_formatter = BankFormatter.new(
    Kernel,
    BankManager.new
  )
  bank_formatter.run
end
