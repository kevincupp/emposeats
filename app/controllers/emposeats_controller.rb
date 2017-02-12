class EmposeatsController < ApplicationController
  def index
    @quote = BTTFQuote.order("RAND()").first.quote
    @dailystats = DailyStat.order(id: :desc).limit(15)
    @seats = EmptySeats.order(id: :desc).first.seats
    @currentstats = CurrentStats.first
  end

  def self.broadcast_new_seats
    seats = EmptySeats.order(id: :desc).first.seats
    currentstats = CurrentStats.first
    markup = render partial: 'emposeats/seats', locals: {seats: seats, currentstats: currentstats }

    ActionCable.server.broadcast 'seats', markup: markup
  end
end
