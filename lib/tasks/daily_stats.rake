task :daily_stats => [:environment] do
  yesterday = Time.new - 1.day
  date = yesterday.strftime('%a, %d %b %Y')
  minutes = EmptySeats.where("date LIKE '#{date} %'").order(id: :desc)

  if minutes.empty?
    exit
  end

  hours = hour_averages(minutes)

  stat = DailyStat.new
  stat.date = Time.new(yesterday.year, yesterday.month, yesterday.day).strftime('%a, %d %b %Y %H:%M:%S %z')
  stat.busy = hour_range(hours.min_by{|k,v| v}[0])
  stat.calm = hour_range(hours.max_by{|k,v| v}[0])
  stat.average = minutes.collect(&:seats).average
  stat.checkins = checkins(minutes)
  stat.save
end

# Group minutes by hour to get averages
def hour_averages(minutes)
  hours = {}
  minutes.chunk { |minute|
    minute.formatted_hour
  }.each { |hour, array|
    hours[hour] = array.collect(&:seats).average
  }
  hours
end

def hour_range(hour)
  hour1 = Time.parse(hour)
  hour2 = hour1 + 1.hour

  hour1.strftime('%-l:%M') + ' - ' + hour2.strftime('%-l:%M%P')
end

# I don't quite understand this, copied logic from old site
def checkins(minutes)
  diffs = []
  minutes.each_with_index do |minute, i|
    diff = i == 0 ? 0 : minutes[i - 1].seats - minute.seats
    if i != 0 && diff < 0 && diff > -30
      diffs.push(diff)
    end
  end

  diffs.sum * -1
end
