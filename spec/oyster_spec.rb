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

  describe "Charging a card for a journey" do
    it "Should return a message on deducting an amount" do
    amount = 5.00
    subject.instance_variable_set(:@balance, 10.00)
    expect { subject.deduct(amount) }.to change { subject.balance }.from(10.00).to(5.00)
    end

  end

  describe "Card status" do
    it "#touch_in changes card status to 'in use'" do
      subject.instance_variable_set(:@card_status, false)
      expect { subject.touch_in }.to change { subject.card_status }.from(false).to(true)
    end
    
    it "touch_out changes card status to 'not in use'" do
      subject.instance_variable_set(:@card_status, true)
      expect { subject.touch_out }.to change { subject.card_status }.from(true).to(false)
    end

    it "#in_journey? returns true if card is 'in use'" do
      subject.instance_variable_set(:@card_status, true)
      expect(subject.in_journey?).to eq true
    end

  end


  end 
end