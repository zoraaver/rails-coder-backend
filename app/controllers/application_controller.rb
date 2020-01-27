class ApplicationController < ActionController::API
  def test
    render json: {message: "hello"}
  end

  def run_test
    File.open("tests/ruby/code.rb", "w") do |f|
      f.puts(params[:code])
    end
    system("rspec tests/ruby/spec --format json --out app/controllers/results.json")
    data = File.read( 'app/controllers/results.json')
    render json: data

  end

end
