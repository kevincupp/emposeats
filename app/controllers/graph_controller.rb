class GraphController < ApplicationController
  layout false

  def twentyfourhr
    @today = EmptySeats.today
    @yesterday = EmptySeats.yesterday

    @min = @today.all_seats.min
    @max = @today.all_seats.max
    @average = @today.all_seats.average
  end

  def minutes
    @minutes = EmptySeats.latest.limit(30)
    @min = @minutes.all_seats.min
  end

  def hours
    today = EmptySeats.today

    @hours = {}
    today.reverse.chunk { |minute|
      minute.formatted_hour
    }.each { |hour, array|
      @hours[hour] = array.pluck(:seats).average
    }
  end

  def days
    @days = DailyStat.latest.limit(14)
  end

  def future_hours
    @future_hours = []
    (1..24).each do |i|
      date = Time.new + i.hour
      minutes = EmptySeats.find_by_date(date).limit(180).all

      @future_hours.push({
        time: date.strftime('%-l%p'),
        average: minutes.all_seats.average,
        std_dev: minutes.all_seats.std_dev
      })
    end
  end

  def future_days
    @future_days = []
    (0..6).each do |i|
      date = Time.new + i.day
      days = DailyStat.find_by_date(date).limit(2).all

      @future_days.push({
        time: date.strftime('%b %e'),
        average: days.averages.average,
        std_dev: days.averages.std_dev
      })
    end
  end
end
