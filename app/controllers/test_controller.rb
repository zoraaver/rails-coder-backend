class TestController < ApplicationController

  before_action :require_login

  @@extensions = {
    "cpp" => ".cpp",
    "ruby" => ".rb",
    "javascript" => ".js"
  }

  @@forbidden_words = {
    "cpp" => ["include", "define", "system", "FILE", "fstream", "fopen", "cin"],
    "ruby" => ["system", "File", "gets", "IO", "Dir", "Kernel", "require"],
    "javascript" => ["require", "import"]
  }

  def run_test
    unique_id = @current_user.id
    lesson = Lesson.find(params[:id])
    
    File.open("#{unique_id}errors.txt", "w")
    File.open("#{unique_id}results.json", "w")

    if params[:code] =~ Regexp.union(@@forbidden_words[lesson.language])
      render json: {error: "Invalid submission", results: ""}
      return
    end
    

    user_lesson = lesson.user_lessons.find_by(user: @current_user) 

    user_lesson.update(code: params[:code])

    test = lesson.test.gsub("code#{@@extensions[lesson.language]}", "code#{unique_id.to_s + @@extensions[lesson.language]}")

    passed = false

    File.open("tests/#{lesson.language}/code#{unique_id.to_s + @@extensions[lesson.language]}", "w") do |f|
      f.puts(params[:code])
    end

    File.open("tests/#{lesson.language}/test#{unique_id.to_s + @@extensions[lesson.language]}", "w") do |f|  
      f.puts(test)
    end 

    case params[:language]

    when "ruby"
      passed = system("rspec tests/ruby/test#{unique_id}.rb --format json --out #{unique_id}results.json")
    when "javascript"
      passed = system("mocha tests/javascript -R json 1> #{unique_id}results.json 2> #{unique_id}errors.txt")
    when "cpp"
      compiled = system("g++ tests/cpp/test#{unique_id}.cpp -std=c++11 -lgtest -pthread -o tests/cpp/test#{unique_id}.o 2> #{unique_id}errors.txt")

      if compiled 
        passed = system("./tests/cpp/test#{unique_id}.o --gtest_output='json:#{unique_id}results.json'")
        File.delete("tests/cpp/test#{unique_id}.o")
      end

    else
      render json: {message: "invalid language"}
    end

    user_lesson.update(status: 2) if passed && user_lesson.status != 2;
    render json: {results: File.read( "#{unique_id}results.json"), error: File.read("#{unique_id}errors.txt")}

    File.delete("tests/#{lesson.language}/test#{unique_id.to_s + @@extensions[lesson.language]}")
    File.delete("#{unique_id}errors.txt")
    File.delete("#{unique_id}results.json")
    File.delete("tests/#{lesson.language}/code#{unique_id.to_s + @@extensions[lesson.language]}")

  end
end
