class LegacyApiController < ApplicationController
  def seats
    @seats = EmptySeats.order(id: :desc).first.seats
    @currentstats = CurrentStats.first
    render content_type: 'text/xml', layout: false
  end

  def sparkline
    @seats = EmptySeats.order(id: :desc).limit(60).collect(&:seats)
    render content_type: 'text/xml', layout: false
  end

  def graph
    @minutes = EmptySeats.order(id: :desc).limit(1440)
    render content_type: 'text/xml', layout: false
  end

  def stats
    dailystats = DailyStat.order(id: :desc).limit(15)

    @stats = []
    dailystats.each do |stat|
      date = Date.parse(stat.date).strftime('%a, %d %b %Y')
      @stats.push({
        dailystat: stat,
        sparkline: EmptySeats.where("date LIKE '#{date}%'").order(id: :asc)
      })
    end
    render content_type: 'text/xml', layout: false
  end
end
