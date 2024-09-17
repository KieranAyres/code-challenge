require_relative '../age_identifier'

RSpec.describe AgeIdentifier do

  it 'has a hash of values representing the months of the year' do
    expect(AgeIdentifier::MONTHS_OF_THE_YEAR[:january]).to eql(1)
    expect(AgeIdentifier::MONTHS_OF_THE_YEAR[:february]).to eql(2)
    expect(AgeIdentifier::MONTHS_OF_THE_YEAR[:march]).to eql(3)
    expect(AgeIdentifier::MONTHS_OF_THE_YEAR[:april]).to eql(4)
    expect(AgeIdentifier::MONTHS_OF_THE_YEAR[:may]).to eql(5)
    expect(AgeIdentifier::MONTHS_OF_THE_YEAR[:june]).to eql(6)
    expect(AgeIdentifier::MONTHS_OF_THE_YEAR[:july]).to eql(7)
    expect(AgeIdentifier::MONTHS_OF_THE_YEAR[:august]).to eql(8)
    expect(AgeIdentifier::MONTHS_OF_THE_YEAR[:september]).to eql(9)
    expect(AgeIdentifier::MONTHS_OF_THE_YEAR[:october]).to eql(10)
    expect(AgeIdentifier::MONTHS_OF_THE_YEAR[:november]).to eql(11)
    expect(AgeIdentifier::MONTHS_OF_THE_YEAR[:december]).to eql(12)
  end

  it 'can extract the year of a car out of a given date and return only the year without the century' do
    extracted_year = AgeIdentifier.extract_year('29-6-15')
    expect(extracted_year).to eql('15')
  end

  it 'can extract the year of a car out of a given date and return only the year without the century and add 50 to it' do
    extracted_year = AgeIdentifier.extract_year('29-11-15')
    expect(extracted_year).to eql('65')
  end

  it 'can modify a date to just return the year of the car' do
    modified_date = AgeIdentifier.modify_without_century('16-05-2024')
    expect(modified_date).to eql('24')
  end

  it 'can modify a date to just return the year of the car and add 50 to the number depending on the date' do
    modified_date = AgeIdentifier.modify_without_century_add_fifty('16-01-2024')
    expect(modified_date).to eql(74)
  end

end
