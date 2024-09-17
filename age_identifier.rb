# frozen_string_literal: true
require 'date'

module AgeIdentifier
  module_function

  MONTHS_OF_THE_YEAR = {
    january: 1,
    february: 2,
    march: 3,
    april: 4,
    may: 5,
    june: 6,
    july: 7,
    august: 8,
    september: 9,
    october: 10,
    november: 11,
    december: 12
  }

  def modify_without_century(date)
    date.to_s.chomp.split('-')[2][-2..-1]
  end

  def modify_without_century_add_fifty(date)
    date.to_s.chomp.split('-')[2][-2..-1].to_i + 50
  end

  def extract_year(date)
    dates = []
    if Date.parse(date).month > AgeIdentifier::MONTHS_OF_THE_YEAR[:february] && Date.parse(date).month < AgeIdentifier::MONTHS_OF_THE_YEAR[:september]
      dates << modify_without_century(date)
    else
      date = modify_without_century_add_fifty(date)
      dates << date.to_s
    end
    dates.first
  end
end

