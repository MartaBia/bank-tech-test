require 'bank_account'

RSpec.describe BankAccount do
  it 'returns an empty statement when no transaction is done' do
    bank_account = BankAccount.new([])
    expect(bank_account.get_statement).to eq (
      "DATE || CREDIT || DEBIT || BALANCE\n- No transactions available -"
    )
  end

  it 'returns the statement when an initial transaction is passed' do
    fixed_date = DateTime.new(2023, 01, 10)

    transaction = double(:transaction, date: fixed_date , type: 'deposit', amount: 1000)
    bank_account = BankAccount.new([transaction])
    expect(bank_account.get_statement).to eq (
      "DATE || CREDIT || DEBIT || BALANCE\n10/01/2023 || 1000.00 || || 1000.00"
    )
  end

  it 'creates a deposit transaction' do
    bank_account = BankAccount.new([])
    fixed_date = DateTime.new(2023, 01, 10)
    allow(DateTime).to receive(:now).and_return(fixed_date)

    bank_account.deposit(1000)
    
    expect(bank_account.instance_variable_get(:@transactions).length).to eq(1)
    expect(bank_account.instance_variable_get(:@transactions)[0].date).to eq(fixed_date)
    expect(bank_account.instance_variable_get(:@transactions)[0].type).to eq('deposit')
    expect(bank_account.instance_variable_get(:@transactions)[0].amount).to eq(1000)
  end

  it 'creates a withdrawal transaction' do
    bank_account = BankAccount.new([])
    fixed_date = DateTime.new(2023, 01, 10)
    allow(DateTime).to receive(:now).and_return(fixed_date)

    bank_account.withdraw(1000)
    
    expect(bank_account.instance_variable_get(:@transactions).length).to eq(1)
    expect(bank_account.instance_variable_get(:@transactions)[0].date).to eq(fixed_date)
    expect(bank_account.instance_variable_get(:@transactions)[0].type).to eq('withdrawal')
    expect(bank_account.instance_variable_get(:@transactions)[0].amount).to eq(1000)
  end

  it 'returns the statement with 1 deposit transaction' do
    bank_account = BankAccount.new([])
    fixed_date = DateTime.new(2023, 01, 10)
    allow(DateTime).to receive(:now).and_return(fixed_date)

    bank_account.deposit(1000)
    
    expect(bank_account.get_statement).to eq (
      "DATE || CREDIT || DEBIT || BALANCE\n10/01/2023 || 1000.00 || || 1000.00"
    )
  end

  it 'returns the statement with 2 transaction' do
    bank_account = BankAccount.new([])
    fixed_date = DateTime.new(2023, 01, 10)
    allow(DateTime).to receive(:now).and_return(fixed_date)

    bank_account.deposit(1500)
    bank_account.withdraw(500)
    
    expect(bank_account.get_statement).to eq (
      "DATE || CREDIT || DEBIT || BALANCE\n10/01/2023 || || 500.00 || 1000.00\n10/01/2023 || 1500.00 || || 1500.00"
    )
  end

  it 'returns the statement with 2 transaction done in 2 different dates' do
    bank_account = BankAccount.new([])
    fixed_date_1 = DateTime.new(2023, 01, 10)
    allow(DateTime).to receive(:now).and_return(fixed_date_1)

    bank_account.deposit(1500)

    fixed_date_2 = DateTime.new(2023, 01, 13)
    allow(DateTime).to receive(:now).and_return(fixed_date_2)
    bank_account.withdraw(500)
    
    expect(bank_account.get_statement).to eq (
      "DATE || CREDIT || DEBIT || BALANCE\n13/01/2023 || || 500.00 || 1000.00\n10/01/2023 || 1500.00 || || 1500.00"
    )
  end

  it 'returns and error message if the withdrawal is higher than the current balance' do
    bank_account = BankAccount.new([])
    fixed_date = DateTime.new(2023, 01, 10)
    allow(DateTime).to receive(:now).and_return(fixed_date)

    bank_account.withdraw(500)
    
    expect { bank_account.get_statement }.to raise_error('Operation not permitted')
  end

  it 'returns the statement for few operations' do
    bank_account = BankAccount.new([])

    fixed_date_1 = DateTime.new(2023, 01, 10)
    allow(DateTime).to receive(:now).and_return(fixed_date_1)
    bank_account.deposit(1000)

    fixed_date_2 = DateTime.new(2023, 01, 13)
    allow(DateTime).to receive(:now).and_return(fixed_date_2)
    bank_account.deposit(1000)

    fixed_date_3 = DateTime.new(2023, 01, 15)
    allow(DateTime).to receive(:now).and_return(fixed_date_3)
    bank_account.withdraw(500)
    
    expect(bank_account.get_statement).to eq (
      "DATE || CREDIT || DEBIT || BALANCE\n15/01/2023 || || 500.00 || 1500.00\n13/01/2023 || 1000.00 || || 2000.00\n10/01/2023 || 1000.00 || || 1000.00"
    )
  end
end
