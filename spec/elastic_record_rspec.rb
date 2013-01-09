require 'spec_helper'
describe "Testing meta functions on ElasticRecord" do
	before :each do
		@sample_hash={:type=>'person', :name=>'Sample Name', :age=>'33'}
		@er = ElasticRecord.new(@sample_hash)
	end
	it "Should create new ElasticRecord" do
		
		@er.class.to_s.should eql 'ElasticRecord'
	end

	it "Should have 'name' method, and be able to change it" do
		@er.name.should eql 'Sample Name'
		@er.name="dr. Sample Name"
		@er.name.should eql "dr. Sample Name"
	end

	it "should take new parameter" do
		@er.some_random_propery=3.14
		@er.some_random_propery.should eql 3.14
	end

	it "shold have to hash method" do
		@er.to_h.should eql @sample_hash
	end

	it "should have to json method" do
		@er.to_json.should eql @sample_hash.to_json
	end
	
end