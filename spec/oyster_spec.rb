require 'oyster'

describe Oystercard do
  describe '#balance' do
     # set the balance
      it { expect(subject.balance).to be_an Float } 
  end

  describe "topping up the card" do 
    it "tops up the card by a given amount" do 
      amount = 0.01 
     expect(subject.top_up(amount)).to eq "Your card is topped up"
  end 

  context "balance is exceeded"  do 
    before do
      allow(subject).to receive(:exceeded_balance?).and_return true
    end
    it "topping up and exceeding balance and giving error message" do 
      amount = 95.00
      expect { subject.top_up(amount) }.to raise_error "You've exceeded the amount"
    end 
  end 
end 


end