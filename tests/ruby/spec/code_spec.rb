require 'rspec'
require_relative '../code.rb'

describe 'factorial' do
  it "finds the factorial of 5" do
    expect(factorial(5)).to be(120)
  end
  it "finds the factorial of 0" do
    expect(factorial(0)).to be(1)
  end
end

describe 'helloWorld' do
  it "returns 'HEY there!'" do
    expect(helloWorld).to eq( "HEY there!")
  end
end
