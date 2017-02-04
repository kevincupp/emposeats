class EmposeatsController < ApplicationController
	def index
		@quote = BTTFQuote.order("RAND()").first.quote
		@dailystats = DailyStat.order(id: :desc).limit(15)
		@seats = EmptySeats.order(id: :desc).first.seats
		@currentstats = CurrentStats.first
	end

	def test
		@seats = EmptySeats.order(id: :desc).first.seats
		@currentstats = CurrentStats.first
		@markup = render partial: "seats"

		ActionCable.server.broadcast 'seats',
			markup: @markup
		head :ok
	end
end
