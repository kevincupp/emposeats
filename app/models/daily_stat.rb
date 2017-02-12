class DailyStat < ActiveRecord::Base
  self.table_name = 'dailystats'

  def formatted_short_day
    DateTime.parse(self.date).strftime('%b %e')
  end
end
