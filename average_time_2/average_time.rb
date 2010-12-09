class AverageTime
  
  TIME_FORMAT_PATTERN = /(\d+):(\d+)(am|pm)/
  
  MINUTES_PER_HOUR = 60.freeze
  PM_OFFSET = 12.freeze
  
  MINUTES_PER_DAY = (60 * 24).freeze
  
  def self.average_time_of_day times
    # parse time strings into minutes since midnight
    times.map! do |time|
      minutes_since_midnight(time)
    end
    
    p times
    # sum the times and find average
    sum = times.inject(0) do |count, time|
      count += time
    end

    average = sum / times.length

    # format average minutes since midnight into text
    format_to_string(average)
  end
    
  def self.minutes_since_midnight time_as_string
    matches = TIME_FORMAT_PATTERN.match(time_as_string)
    hours   = matches[1].to_i
    minutes = matches[2].to_i
    period  = matches[3].downcase.to_sym
    
    minutes_since_midnight = 0
    
    case period
      when :am
        hours = 0 if hours == 12
        minutes_since_midnight += MINUTES_PER_DAY   # treat a.m. times as one day ahead
      when :pm
        hours += 12 unless hours == 12
    end

    minutes_since_midnight += (hours * MINUTES_PER_HOUR) + minutes
  end
  
  def self.minute_average start, finish
    finish += 1440 if finish < start  # crosses midnight (e.g. 11:59pm -> 12:01am)
    average = (start + finish) / 2
    average.ceil
  end
  
  def self.format_to_string minutes_since_midnight
    return '12:00am' if minutes_since_midnight == 0 || minutes_since_midnight == 1440
    
    minutes_since_midnight %= MINUTES_PER_DAY   # disregard full day cycles

    hours, minutes = minutes_since_midnight.divmod(MINUTES_PER_HOUR)
    period = hours < 12 ? :am : :pm
    
    case period
      when :am
        hours = 12 if hours == 0
      when :pm
        hours -= PM_OFFSET if hours != 12
        hours -= 12 if hours  > 12
    end
    
    return "%d:%02d%s" % [hours, minutes, period]
    
  end
  
end
