class EmptySeats < ActiveRecord::Base
  self.table_name = 'emptyseats'

  before_save :default_values
  after_create :broadcast_cable
  def default_values
    self.date ||= Time.new.strftime('%a, %d %b %Y %H:%M:%S %z')
  end

  def broadcast_cable
    EmposeatsController.broadcast_new_seats
  end

  def formatted_time()
    DateTime.parse(self.date).strftime('%l:%M').strip
  end

  def formatted_hour()
    DateTime.parse(self.date).strftime('%l%p').strip
  end
end
