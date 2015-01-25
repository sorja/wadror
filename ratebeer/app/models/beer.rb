class Beer < ActiveRecord::Base
	belongs_to :brewery
	has_many :ratings, dependent: :destroy

	def average_rating
		# sum = 0
		# ratings.each {|rating| sum = sum + rating.score}
		# sum / ratings.size
		ratings.average(:score)
	end
	def to_s
	    self.name + " | " + self.brewery.name
	end
end
