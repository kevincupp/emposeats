class EmptySeats < ActiveRecord::Base
  self.table_name = 'emptyseats'

  before_save :default_values
  after_create :broadcast_cable

  scope :latest, -> { order(id: :desc) }
  scope :today, -> { latest.limit(1440) }
  scope :yesterday, -> { today.offset(1440) }
  scope :find_by_date, -> (date) {
    day = date.strftime('%a')
    hour = date.strftime('%H')
    where("date LIKE '#{day}% #{hour}:%'").latest
  }

  def self.all_seats
    pluck(:seats)
  end

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
