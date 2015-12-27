module TimeModule
  TIME_ZONE = 'Pacific Time (US & Canada)'

  def formatted_datetime(datetime)
    datetime.in_time_zone(TIME_ZONE).strftime("%I:%M%P, %A, %B %d %Y")
  end
end
