# frozen_string_literal: true

module RandomThreeLetters
  module_function

  INVALID_LETTERS = %w[i k m y].map(&:upcase)

  def generate
    loop do
      letters = ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample
      return letters unless validate_letters(letters.split(''))
    end
  end

  def validate_letters(letters)
    INVALID_LETTERS.any? { |letter| letters.include?(letter) }
  end
end
