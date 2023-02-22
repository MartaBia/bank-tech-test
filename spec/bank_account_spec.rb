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
end
