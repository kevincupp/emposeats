class GraphController < ApplicationController
  layout false

  def twentyfourhr
    @today = EmptySeats.order(id: :desc).limit(1440)
    @yesterday = @today.offset(1440)
  end

  def minutes
    @minutes = EmptySeats.order(id: :desc).limit(60)
  end

  def hours
    today = EmptySeats.order(id: :desc).limit(1440)

    @hours = {}
    today.reverse.chunk { |minute|
      minute.formatted_hour
    }.each { |hour, array|
      @hours[hour] = array.collect(&:seats).average
    }
  end

  def days
    @days = DailyStat.order(id: :desc).limit(14)
  end

  def future_hours
    @future_hours = []
    (1..24).each do |i|
      date = Time.new + i.hour
      day = date.strftime('%a')
      hour = date.strftime('%H')
      minutes = EmptySeats.where("date LIKE '#{day}% #{hour}:%'").order(id: :desc).limit(180).all

      @future_hours.push({
        time: date.strftime('%l%p'),
        average: minutes.collect(&:seats).average,
        std_dev: minutes.collect(&:seats).std_dev
      })
    end
  end

  def future_days
    @future_days = []
    (1..7).each do |i|
      date = Time.new + i.day
      day = date.strftime('%a')
      days = DailyStat.where("date LIKE '#{day}%'").order(id: :desc).limit(2).all

      @future_days.push({
        time: date.strftime('%b %e'),
        average: days.collect(&:average).average,
        std_dev: days.collect(&:average).std_dev
      })
    end
  end
end
