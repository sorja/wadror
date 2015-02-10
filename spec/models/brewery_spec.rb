require 'rails_helper'

RSpec.describe Brewery, type: :model do
	
	it "as the name of year set correctly" do
		brewery = Brewery.create name:"Schlenkerla", year:1674

		# brewery.name.should == "Schlenkerla"
		# brewery.year.should == 1674
		# brewery.valid?.should == true
		# brewery.should be_valid
		expect(brewery.name).to eq("Schlenkerla")
		expect(brewery.year).to eq(1674)
		expect(brewery).to be_valid
	end

	it "without a name is not valid" do
		brewery = Brewery.create year:1969

		# brewery.should_not be_valid
		expect(brewery).not_to be_valid
	end

	describe "when initialized with name Schlenkerla and year 1674" do
		subject { Brewery.create name: "Schlenkerla", year: 1674 }

		it { should be_valid}
		its(:name) {should eq("Schlenkerla")}
		its(:year) {should be(1674)}
	end

end
