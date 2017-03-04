class LegacyApiController < ApplicationController
  def seats
    @seats = EmptySeats.latest.first.seats
    @currentstats = CurrentStats.first
    render content_type: 'text/xml', layout: false
  end

  def sparkline
    @seats = EmptySeats.latest.limit(60).all_seats
    render content_type: 'text/xml', layout: false
  end

  def graph
    @minutes = EmptySeats.today
    render content_type: 'text/xml', layout: false
  end

  def stats
    dailystats = DailyStat.latest.limit(15)

    @stats = []
    dailystats.each do |stat|
      date = Date.parse(stat.date).strftime('%a, %d %b %Y')
      @stats.push({
        dailystat: stat,
        sparkline: sparkline_for_date(stat.date)
      })
    end
    render content_type: 'text/xml', layout: false
  end

  def sparkline_for_date(date)
    date_string = Time.parse(date).strftime('%a, %d %b %Y')
    epoch = Time.parse(date).strftime('%s')

    Rails.cache.fetch("seats-#{epoch}", expires_in: 15.days) do
      EmptySeats.where("date LIKE '#{date_string}%'").order(id: :asc)
    end
  end
end
