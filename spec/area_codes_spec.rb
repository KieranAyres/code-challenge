# frozen_string_literal: true
require_relative '../area_codes'

RSpec.describe AreaCodes do
  it 'can return a valid area code' do
    area_code = AreaCodes::VALID_AREA_CODES.sample
    expect(AreaCodes::VALID_AREA_CODES).to include(area_code)
  end

end
