require 'bank_interface'

RSpec.describe BankInterface do
  before(:each) do
    @io = double :io
    @bank_account = double :bank_account
    @bank_interface = BankInterface.new(@io, @bank_account)

    expect(@io).to receive(:puts).with('Welocme, please select one of the following options:')
    expect(@io).to receive(:puts).with('')
    expect(@io).to receive(:puts).with('1 - Deposit')
    expect(@io).to receive(:puts).with('2 - Withdrawal')
    expect(@io).to receive(:puts).with('3 - Bank statement')
    expect(@io).to receive(:puts).with('9 - Exit')
  end

  it 'tests the case when the user select the number 9 to exit' do
    expect(@io).to receive(:gets).and_return('9')
    expect(@io).to receive(:puts).with('Thank you, goodbye!')

    @bank_interface.run
  end

  it 'tests the case when the user select the wrong number' do
    expect(@io).to receive(:gets).and_return('6')
    expect(@io).to receive(:puts).with("Invalid input.\nPlease, select a number between 1 and 3, or number 9 to exit")

    @bank_interface.run
  end

  it 'tests the case when an input other than a number is inserted' do
    expect(@io).to receive(:gets).and_return('banana')
    expect(@io).to receive(:puts).with("Invalid input.\nPlease, select a number between 1 and 3, or number 9 to exit")

    @bank_interface.run
  end

  it 'raises an error when no input is inserted' do
    expect(@io).to receive(:gets).and_return('')

    expect { @bank_interface.run }.to raise_error(RuntimeError, 'A number must be inserted')
  end
end