require 'test/unit'
require 'average_time_2'

class TC_AverageTime < Test::Unit::TestCase
  
  def setup
    # empty
  end
  
  def test_minutes_since_midnight
    # assert_equal 720,  AverageTime.minutes_since_midnight("12:00pm")
    # assert_equal 721,  AverageTime.minutes_since_midnight("12:01pm")        
    # assert_equal 1439, AverageTime.minutes_since_midnight("11:59pm")
    # 
    # assert_equal 1440, AverageTime.minutes_since_midnight("12:00am")
    # assert_equal 1441, AverageTime.minutes_since_midnight("12:01am")
    # assert_equal 2159, AverageTime.minutes_since_midnight("11:59am")
  end
    
  def test_minute_average
    # assert_equal 0, AverageTime.minute_average(0, 1)
    # assert_equal 1, AverageTime.minute_average(0, 3)
    # 
    # assert_equal 30,  AverageTime.minute_average(0, 60)
    # assert_equal 360, AverageTime.minute_average(0, 720)
    #     
    # # 11:59am -> 12:01pm
    # assert_equal 720, AverageTime.minute_average(719, 721)
    # 
    # # 11:59pm -> 12:01am
    # assert_equal 1440, AverageTime.minute_average(1439, 1)
  end
    
  def test_format_to_string
    # assert_equal "12:00am", AverageTime.format_to_string(0)
    # assert_equal "12:01am", AverageTime.format_to_string(1)
    # 
    # assert_equal "11:59am", AverageTime.format_to_string(719)
    # assert_equal "12:00pm", AverageTime.format_to_string(720)
    # assert_equal "12:01pm", AverageTime.format_to_string(721)
    # 
    # assert_equal "11:59pm", AverageTime.format_to_string(1439)
    # assert_equal "12:00am", AverageTime.format_to_string(1440)
    # assert_equal "12:01am", AverageTime.format_to_string(1441)
  end
  
  def test_average_time_of_day
    times = ["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"]
    assert_equal "12:01am", AverageTime.average_time_of_day(times)

    times = ["6:41am", "6:51am", "7:01am"]
    assert_equal "06:51am", AverageTime.average_time_of_day(times)
    
    times = ["11:59pm", "12:01am"]
    assert_equal "12:00am", AverageTime.average_time_of_day(times)
         
    times = ["11:59am", "12:01pm"]
    assert_equal "12:00pm", AverageTime.average_time_of_day(times)
        
    times = ["11:58pm", "12:00pm"]
    assert_equal "05:59pm", AverageTime.average_time_of_day(times)
  end

end