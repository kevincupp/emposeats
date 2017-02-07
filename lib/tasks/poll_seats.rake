require 'net/http'

task :poll_seats => [:environment] do
	url = URI.parse('https://empo-apps.emporium.vt.edu/checkin/listfreeemporiumseats')
	req = Net::HTTP::Get.new(url.to_s)
	http = Net::HTTP.new(url.host, url.port)
	http.use_ssl = true
	response = http.request(req).body
	seats = /&nbsp;&nbsp;&nbsp;<span>(\d+)<\/span>/.match(response)[1]

	last_minute = EmptySeats.order(id: :desc).first
	last_hour = EmptySeats.order(id: :desc).offset(60).first

	currentstats = CurrentStats.first
	currentstats.minutediff = seats.to_i - last_minute.seats
	currentstats.hourdiff = seats.to_i - last_hour.seats
	currentstats.save

	emptyseats = EmptySeats.new
	emptyseats.seats = seats
	emptyseats.save
end
