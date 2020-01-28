class ApplicationController < ActionController::API
  def test
    render json: {message: "hello"}
  end

  def run_test
    case params[:language]

    when "ruby"
      File.open("tests/ruby/code.rb", "w") do |f|
        f.puts(params[:code])
      end
      system("rspec tests/ruby/spec --format json --out app/controllers/results.json")

    when "javascript"
      File.open("tests/javascript/code.js", "w") do |f|
        f.puts(params[:code])
      end
      system("mocha tests/javascript -R json > app/controllers/results.json")

    else
      render json: {message: "invalid language"}
    end
    render json: File.read( 'app/controllers/results.json')

  end

end
