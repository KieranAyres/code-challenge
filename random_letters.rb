# frozen_string_literal: true

module RandomLetters
  module_function

  INVALID_LETTERS = %w[i k m y].map(&:upcase)

  def generate
    loop do
      letters = ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample
      return letters unless valid?(letters.split(''))
    end
  end

  def generate_second_letter(swansea: false)
    if swansea
      ('A'..'K').to_a.sample
    else
      ('L'..'Z').to_a.sample
    end
  end

  def valid?(letters)
    INVALID_LETTERS.any? { |letter| letters.include?(letter) }
  end
end
