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

#   add test for generating a second letter

end