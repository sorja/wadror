require 'rails_helper'

RSpec.describe Beer, type: :model do
	it "is saved if it has name and style" do
		beer = Beer.create name:"Beer", style:"hevonen"

		expect(beer).to be_valid
		expect(Beer.count).to eq(1)
	end

	it "is not saved without a name" do
		beer = Beer.create style:"toinen hevonen"

		expect(beer).not_to be_valid
		expect(Beer.count).to eq(0) 
	end

	it "is not saved wihtout a style" do
		beer = Beer.create name:"hevos-kalja"

		expect(beer).not_to be_valid
		expect(Beer.count).to eq(0)  
	end
end
