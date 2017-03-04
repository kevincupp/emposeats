class EmposeatsController < ApplicationController
  def index
    @quote = BTTFQuote.random
    @dailystats = DailyStat.latest.limit(15)
    @seats = EmptySeats.latest.first.seats
    @currentstats = CurrentStats.first
  end
end
