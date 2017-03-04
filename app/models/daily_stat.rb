class DailyStat < ActiveRecord::Base
  self.table_name = 'dailystats'

  scope :latest, -> { order(id: :desc) }
  scope :averages, -> { pluck(:average) }
  scope :find_by_date, -> (date) {
    day = date.strftime('%a')
    where("date LIKE '#{day}%'").latest
  }

  def formatted_short_day
    DateTime.parse(self.date).strftime('%b %e')
  end
end
