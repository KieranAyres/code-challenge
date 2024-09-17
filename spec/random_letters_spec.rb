# frozen_string_literal: true
require_relative '../random_letters'

RSpec.describe RandomLetters do

  it 'can produce a string of letters' do
    letters = RandomLetters.generate
    expect(letters).to be_kind_of(String)
  end

  it 'can produce a 3 letter string' do
    letters = RandomLetters.generate
    expect(letters.length).to eql(3)
  end

  it 'can validate three letters to true' do
    invalid = RandomLetters.valid?(['I', 'P', 'O'])
    expect(invalid).to eql(true)
  end

  it 'can validate three letters to true' do
    valid = RandomLetters.valid?(['A', 'P', 'O'])
    expect(valid).to eql(false)
  end

  it 'can generate a random letter for Swansea in a specified range' do
    swansea_range = ('A'..'K')
    letter = RandomLetters.generate_second_letter(swansea: true)
    expect(swansea_range).to include(letter)
  end

  it 'can generate a random letter for Cardiff in a specified range' do
    cardiff_range = ('L'..'Z')
    letter = RandomLetters.generate_second_letter(swansea: false)
    expect(cardiff_range).to include(letter)
  end

end