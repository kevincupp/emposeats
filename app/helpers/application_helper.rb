module ApplicationHelper
  def get_color_code(average)
    case average
    when 0..50 then '8F0814'
    when 51..100 then 'D80011'
    when 101..200 then 'FF6600'
    when 201..300 then 'FFD100'
    when 301..600 then '84BF24'
    end
  end

  def get_color_class(average)
    case average
    when 0..50 then 'level1'
    when 51..100 then 'level2'
    when 101..200 then 'level3'
    when 201..300 then 'level4'
    when 301..600 then 'level5'
    end
  end

  def get_std_dev_accuracy_color(std_dev)
    case std_dev
    when 0..10 then '006699'
    when 11..25 then '2697CF'
    when 26..50 then '5FCAFF'
    when 51..60 then '8FDAFF'
    when 61..70 then 'BFEAFF'
    when 71..80 then 'E0EAEF'
    when 81..100 then 'DFDFDF'
    when 101..150 then 'EFEFEF'
    else 'FFFFFF'
    end
  end
end
