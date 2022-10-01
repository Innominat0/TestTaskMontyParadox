require_relative '../testTaskMonty'

describe 'ExampleSpec' do
  it 'is true' do
    expect(true).to be true
  end
end

describe Monty do 
	before {@testMonty = Monty.new(false)}

	it "should know if changes door or not" do
		expect(@testMonty.changeDoor).to eq(true).or eq(false)
	end 

	it "should simulate and return win or loose" do
		expect(@testMonty.simulate).to eq(false).or eq(true)
	end

	it "should simulate a great number of those and return a percentage of wins" do
		expect(@testMonty.simulateN(100)).to be_a(Float)
	end 

	it "should be less then 100%" do
		expect(@testMonty.simulateN(100)).to be < 100
	end 
end