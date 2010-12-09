require 'Time'

class AverageTime

  SECONDS_PER_DAY = 60 * 60 * 24
  MIDNIGHT = Time.parse("12:00am").to_i
  NOON     = Time.parse("12:00pm").to_i

  def self.average_time_of_day times
    seconds = []
    times.each { |time| seconds << Time.parse(time).to_i }
    seconds.sort!
    if (seconds.first - MIDNIGHT) < (seconds.last - NOON)
      seconds.map! { |s| s < NOON ? s += SECONDS_PER_DAY : s }
    end
    Time.at(seconds.inject { |sum, n| sum += n}.to_f / seconds.length).strftime("%I:%M%p").downcase
  end
end
