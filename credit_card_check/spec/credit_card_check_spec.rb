require './creditcardcheck'

describe CreditCardCheck do

  it 'returns false if outside cc number norms' do
    subject = described_class.new("123")
    expect(subject.valid_length).to eq false
  end

  it 'returns true if outside cc number norms' do
    subject = described_class.new("1234567891234")
    expect(subject.valid_length).to eq true
  end

  it 'returns a provider' do
    subject = described_class.new("3411113465748213")
    subject.determine_provider
    expect(subject.provider).to eq "Amex"
  end

  it 'returns unknown when unable to match a provider' do
    subject = described_class.new("7341113465748213")
    subject.determine_provider
    expect(subject.provider).to eq "Unknown"
  end

  it 'valid card number if it passes the luhn algorithm check' do
    subject = described_class.new("4408041234567893")
    expect(subject.luhn_check).to eq true
  end

  it 'invalid card number if it does not passes the luhn algorithm check' do
    subject = described_class.new("440804123456773")
    expect(subject.luhn_check).to eq false
  end
end
