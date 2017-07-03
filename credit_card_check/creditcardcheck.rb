class CreditCardCheck
  attr_reader :provider, :valid_length

  def initialize(card_number)
    @card_number = card_number
    @provider = ""
    @valid_length = card_number_length_valid?
  end

  def luhn_check
    reversed_cc_number = @card_number.reverse
    split = reversed_cc_number.split("").map(&:to_i)
    (1..split.length - 1).step(2).each do |index|
      split[index] = (split[index].to_i * 2)
    end
    number = split.join.split("").map(&:to_i)
    number.inject(:+) % 10 == 0
  end

  def card_number_length_valid?
    @card_number.length <= 16 && @card_number.length >= 13
  end

  def determine_provider
    provider_card_nos.each do |key, value|
      if @card_number.start_with?(key)
        @provider = value
      end
    end
    if @provider == ''
      @provider = "Unknown"
    end
  end

  def provider_card_nos
    { "34" => "Amex",
      "37" => "Amex",
      "6011" => "Discover",
      "51" => "Mastercard",
      "52" => "Mastercard",
      "53" => "Mastercard",
      "54" => "Mastercard",
      "55" => "Mastercard",
      "4" => "Visa" }
  end

end
