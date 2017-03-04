class EmptySeats < ActiveRecord::Base
  self.table_name = 'emptyseats'

  before_save :default_values
  after_create :broadcast_cable
  def default_values
    self.date ||= Time.new.strftime('%a, %d %b %Y %H:%M:%S %z')
  end

  def broadcast_cable
    markup = ApplicationController.renderer.render(
      partial: 'emposeats/seats',
      locals: {
        :seats => EmptySeats.latest.first.seats,
        :currentstats => CurrentStats.first
      }
    )

    ActionCable.server.broadcast 'seats', markup: markup
  end

  def formatted_time
    DateTime.parse(self.date).strftime('%-l:%M')
  end

  def formatted_hour
    DateTime.parse(self.date).strftime('%-l%p')
  end
end
