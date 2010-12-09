class AverageTime
  
  MINUTES_PER_HOUR = 60.freeze
  HOURS_PER_PERIOD = 12.freeze
  
  TIME_FORMAT_REGEX = /(\d+):(\d+)(am|pm)/
  
  def self.average_time_of_day times
    times.map! do |time|
      text_to_offset(time)
    end
    
    average = average_offset(times[0], times[1])
    
    offset_to_text(average)
  end
  
  private
    def self.average_offset start, finish
      finish += 1440 if finish < start  # crossed midnight (e.g. 11:59pm -> 12:01am)
      (start + finish) / 2
    end
  
    def self.text_to_offset time_as_string
      parsed_time = time_as_string.scan(TIME_FORMAT_REGEX)
      hours   = parsed_time[0][0].to_i
      minutes = parsed_time[0][1].to_i
      period  = parsed_time[0][2].downcase.to_sym
  
      case period
        when :am
          hours = 0 if hours == 12
        when :pm
          hours += 12 unless hours == 12
      end
    
      (hours * MINUTES_PER_HOUR) + minutes
    end
  
    def self.offset_to_text offset

      return '12:00am' if offset == 0 || offset == 1440
      hours   = offset / MINUTES_PER_HOUR
      minutes = offset % MINUTES_PER_HOUR
    
      if is_am?(offset)
        hours = offset < MINUTES_PER_HOUR ? 12 : hours
        return "%d:%02dam" % [hours, minutes]
      else
        hours = hours == 12 ? 12 : hours - HOURS_PER_PERIOD
        return "%d:%02dpm" % [hours, minutes]
      end
    end
  
    def self.is_am? offset
      offset < HOURS_PER_PERIOD * MINUTES_PER_HOUR
    end
  
end
