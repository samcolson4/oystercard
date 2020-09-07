require 'oyster'

describe Oystercard do
  describe '#balance' do
     # set the balance
      it { expect(subject.balance).to be_an Float } 
  end
end