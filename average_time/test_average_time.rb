require 'test/unit'
require 'average_time'

class TC_AverageTime < Test::Unit::TestCase
  
  def setup
    # empty
  end
  
  def test_text_to_offset
    # assert_equal 0, AverageTime.text_to_offset("12:00am")
    #     assert_equal 1, AverageTime.text_to_offset("12:01am")
    #     
    #     assert_equal 719, AverageTime.text_to_offset("11:59am")
    #     assert_equal 720, AverageTime.text_to_offset("12:00pm")
    #     assert_equal 721, AverageTime.text_to_offset("12:01pm")
    #     
    #     assert_equal 1439, AverageTime.text_to_offset("11:59pm")
  end
  
  def test_offset_to_text
    # assert_equal "12:00am", AverageTime.offset_to_text(0)
    # assert_equal "12:01am", AverageTime.offset_to_text(1)
    # 
    # assert_equal "11:59am", AverageTime.offset_to_text(719)
    # assert_equal "12:00pm", AverageTime.offset_to_text(720)
    # assert_equal "12:01pm", AverageTime.offset_to_text(721)
    # 
    # assert_equal "11:59pm", AverageTime.offset_to_text(1439)
    # assert_equal "12:00am", AverageTime.offset_to_text(1440)
  end
  
  def test_average_offset
    # assert_equal 30, AverageTime.average_offset(0, 60)
    # assert_equal 60, AverageTime.average_offset(0, 120)
    
    # 11:59am -> 12:01pm
    # assert_equal 720, AverageTime.average_offset(719, 721)
    
    # 11:59pm -> 12:01am
    # assert_equal 1440, AverageTime.average_offset(1439, 1)
  end
  
  def test_is_am?
    # assert_equal true,  AverageTime.is_am?(0)
    # assert_equal true,  AverageTime.is_am?(1)
    # assert_equal true,  AverageTime.is_am?(719)
    # assert_equal false, AverageTime.is_am?(720)
    # assert_equal false, AverageTime.is_am?(1439)
  end
  
  def test_average_time_of_day
    times = ["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"]
    # assert_equal "12:01am", AverageTime.average_time_of_day(times)

    times = ["6:41am", "6:51am", "7:01am"]
    # assert_equal "6:51am", AverageTime.average_time_of_day(times)
    
    times = ["11:59pm", "12:01am"]
    # assert_equal "12:00am", AverageTime.average_time_of_day(times)
         
    times = ["11:59am", "12:01pm"]
    # assert_equal "12:00pm", AverageTime.average_time_of_day(times)
        
    times = ["11:58pm", "12:00pm"]
    assert_equal "5:59pm", AverageTime.average_time_of_day(times)
  end
  

end