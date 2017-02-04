class SeatsChannel < ApplicationCable::Channel
	def subscribed
		stream_from 'seats'
	end
end
