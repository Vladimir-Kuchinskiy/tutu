# frozen_string_literal: true

module SearchesHelper
  def convert_datetime(datetime)
    datetime.try(:strftime,"%d.%m.%y - %H:%M")
  end
end
