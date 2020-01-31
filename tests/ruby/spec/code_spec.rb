require 'rspec'
require_relative '../code.rb'

describe "helloWorld" do
  it "returns 'hello world!'" do
    expect(helloWorld).to eq("hello world!")
  end
end
