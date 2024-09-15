# frozen_string_literal: true
require_relative '../random_three_letters'

RSpec.describe RandomThreeLetters do

  it 'can produce a string of letters' do
    letters = RandomThreeLetters.generate
    expect(letters).to be_kind_of(String)
  end

  it 'can produce a 3 letter string' do
    letters = RandomThreeLetters.generate
    expect(letters.length).to eql(3)
  end

  it 'can validate three letters to true' do
    invalid = RandomThreeLetters.valid?(['I', 'P', 'O'])
    expect(invalid).to eql(true)
  end

  it 'can validate three letters to true' do
    valid = RandomThreeLetters.valid?(['A', 'P', 'O'])
    expect(valid).to eql(false)
  end

end