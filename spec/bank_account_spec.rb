require 'bank_account'

RSpec.describe BankAccount do
  it 'returns an empty statement when no transaction is done' do
    @bank_account = BankAccount.new([])
    expect(@bank_account.get_statement).to eq (
      "DATE || CREDIT || DEBIT || BALANCE\n- No transactions available -"
    )
  end

  it 'returns the statement when an initial transaction passed' do
    fixed_date = DateTime.new(2023, 01, 10)
    allow(DateTime).to receive(:now).and_return(fixed_date)

    transaction = double(:transaction, date: fixed_date , type: 'deposit', amount: '1000')
    @bank_account = BankAccount.new([transaction])
    expect(@bank_account.get_statement).to eq (
      "DATE || CREDIT || DEBIT || BALANCE\n10/01/2023 || 1000.00 || || 1000.00"
    )
  end
end
