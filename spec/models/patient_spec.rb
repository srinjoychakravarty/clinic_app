require 'spec_helper'

describe Patient do

	it "should have proper associations" do
		should have_many(:appointments)
	end	

	describe "Validation Macros" do
		it {should validate_presence_of(:first_name)}
		it {should validate_presence_of(:last_name)}
		it {should validate_presence_of(:email)}
		it {should validate_presence_of(:phone)}
		it {should validate_presence_of(:health_id)}
		it {should validate_presence_of(:gender)}
		it {should validate_presence_of(:date_of_birth)}
	end	

	describe "Rejects bad emails" do
		it {should_not allow_value("srin").for(:email)}
		it {should_not allow_value("srin@chak,com").for(:email)}
		it {should_not allow_value("srin@srinj.uk").for(:email)}
		it {should_not allow_value("srin joy@chak.com").for(:email)}
		it {should_not allow_value("srinjoy@chakrav.con").for(:email)}
	end	

	describe "Validates good emails" do
		it {should allow_value("srinjoy@hotmail.com").for(:email)}
		it {should allow_value("srinjoy@qatar.cmu.edu").for(:email)}
		it {should allow_value("srinjoy_c@yahoo.org").for(:email)}
		it {should allow_value("srinjoy1993@cooltoad.gov").for(:email)}
		it {should allow_value("sir.joy@gmail.net").for(:email)}
	end	

	
	describe "Validates good phone numbers" do
		it {should allow_value("97444548624").for(:phone)}
	end	

	describe "Rejects bad phone numbers" do
		it {should_not allow_value("999-DIE-DUDE").for(:phone)}
	end	

	describe "Validates allowed gender" do
		it {should allow_value("Male").for(:gender)}
		it {should allow_value("Female").for(:gender)}
	end	

	describe "Rejects invalid gender" do
		it {should_not allow_value("Discrete").for(:gender)}
	end	
end
