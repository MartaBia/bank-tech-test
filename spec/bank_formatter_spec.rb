require 'bank_formatter'

RSpec.describe BankFormatter do
  before(:each) do
    @io = double :io
    @bank_manager = double :bank_manager
    @bank_formatter = BankFormatter.new(@io, @bank_manager)

    expect(@io).to receive(:puts).with('Welocme, please select one of the following options:')
    expect(@io).to receive(:puts).with('')
    expect(@io).to receive(:puts).with('1 - Deposit')
    expect(@io).to receive(:puts).with('2 - Withdrawal')
    expect(@io).to receive(:puts).with('3 - Bank statement')
    expect(@io).to receive(:puts).with('9 - Exit')
  end

  it 'tests the case when the user select the number to exit' do
    expect(@io).to receive(:gets).and_return('9')
    expect(@io).to receive(:puts).with('Thank you, goodbye!')

    @bank_formatter.run
  end

  it 'tests the case when the user select a wrong option' do
    expect(@io).to receive(:gets).and_return('6')
    expect(@io).to receive(:puts).with('Please, select a number between 1 and 3, or number 9 to exit')

    @bank_formatter.run
  end
end
