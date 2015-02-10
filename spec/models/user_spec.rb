require 'rails_helper'

RSpec.describe User, type: :model do
	it "has the username set correctly" do
		user = User.new username:"Pekka"

		expect(user.username).to   eq("Pekka")
	end

	it "is not saved without a password" do
		user = User.create username:"Pekka"

		expect(user).not_to be_valid
		expect(User.count).to eq(0)
	end

	it "is not saved with too short password" do
		user = User.create username:"Pekka", password:"A4", password_confirmation:"A4"

		expect(user).not_to be_valid
		expect(User.count).to eq(0)
	end

	it "is not  saved without a number in password" do
		user = User.create username:"Pekka", password:"Jello", password_confirmation:"Jello"

		expect(user).not_to be_valid
		expect(User.count).to eq(0) 
	end

	describe "with a proper password" do
		let(:user) { FactoryGirl.create(:user) }

		it "is saved" do
			expect(user).to be_valid
			expect(User.count).to eq(1)
		end

		it "and with two ratings, has the correct average rating" do
			user.ratings << FactoryGirl.create(:rating)
			user.ratings << FactoryGirl.create(:rating2)

			expect(user.ratings.count).to eq(2)
			expect(user.average_rating).to eq(15.0)
		end
	end

	describe "favorite beer" do
		let(:user) { FactoryGirl.create(:user) }
		it "has method for determining the favorite_beer" do
			expect(user).to respond_to(:favorite_beer) 
		end 

		it "without ratings does not have a favorite beer" do
			expect(user.favorite_beer).to  eq(nil)
		end

		it "is the only rated if only one rating" do
			beer = FactoryGirl.create(:beer)
			FactoryGirl.create(:rating, beer:beer, user:user)

			expect(user.favorite_beer).to eq(beer)
		end

		it "is the one with highest rating if several rated" do
			create_beers_with_ratings(1,2,3,4,5,7,8,9,10,11,2,3,4,5, user)
			best = create_beer_with_rating(25, user)

			expect(user.favorite_beer).to eq(best)
		end
	end

	describe "favorite style" do
		let(:user){ FactoryGirl.create(:user)}

		it "has method for determining favorite_style" do
			expect(user).to respond_to(:favorite_style) 
		end

		it "withot ratings does not have a favorite_style" do
			expect(user.favorite_style).to eq(nil) 
		end

		it "is the only rated if only one rating" do
			beer = FactoryGirl.create(:beer)
			rating = FactoryGirl.create(:rating, beer:beer, user:user)

			expect(user.favorite_style).to eq(beer.style) 
		end

		# it "is the one with highest rating average if several rated" do
			# create_beers_with_ratings(1,2,3,20,30,40,49, user)
			# user << Beer.create name:"paras", style:"voitto"
			# Rating.create score:50,  beer:beer
			# 
			# expect(user.favorite_style).to eq(bestbeer.style)
		# end

	end

	def create_beer_with_rating(score, user)
		beer = FactoryGirl.create(:beer)
		FactoryGirl.create(:rating, score:score, beer:beer, user:user)
		beer
	end

	def create_beers_with_ratings(*scores, user)
		scores.each do |score|
			create_beer_with_rating(score, user)
		end
	end

end