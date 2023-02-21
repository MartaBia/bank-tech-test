require 'bank_account'

RSpec.describe BankAccount do
  it 'returns an empty statement when no transaction is done' do
    @bank_account = BankAccount.new([])
    expect(@bank_account.get_statement).to eq (
      "DATE || CREDIT || DEBIT || BALANCE\n"
    )
  end
end
