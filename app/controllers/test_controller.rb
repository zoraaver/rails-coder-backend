class TestController < ApplicationController
  before_action :require_login
  def run_test
    
    lesson = Lesson.find(params[:id])

    user_lesson = lesson.user_lessons.find_by(user: @current_user) 
    
    user_lesson.update(code: params[:code])

    passed = false

    case params[:language]

    when "ruby"

      File.open("tests/ruby/code.rb", "w") do |f|
        f.puts(params[:code])
      end

      File.open("tests/ruby/spec/code_spec.rb", "w") do |f|  
        f.puts(lesson.test)
      end 

      passed = system("rspec tests/ruby/spec --format json --out app/controllers/results.json")

    when "javascript"

      File.open("tests/javascript/code.js", "w") do |f|
        f.puts(params[:code])
      end

      File.open("tests/javascript/test.js", "w") do |f|  
        f.puts(lesson.test)
      end 

      passed = system("mocha tests/javascript -R json > app/controllers/results.json")

    when "cpp"

      File.open("tests/cpp/code.cpp", "w") do |f|
        f.puts(params[:code])
      end

      File.open("tests/cpp/test.cpp", "w") do |f|
          f.puts(lesson.test)
        end
      system("g++ tests/cpp/test.cpp -std=c++11 -lgtest -o tests/cpp/test.o")
      system("./tests/cpp/test.o --gtest_output='json:app/controllers/results.json'")
    else
      render json: {message: "invalid language"}
    end

    user_lesson.update(status: 2) if passed;
    render json: File.read( 'app/controllers/results.json')

  end
end
