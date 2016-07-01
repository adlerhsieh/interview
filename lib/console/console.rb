require 'colorize'
require "readline"

class Console
  def initialize(dir)
    @questions = []
    @dir = dir
  end

  def collect_questions
    Dir["#{Rails.root}/lib/#{@dir}/**/*"].each_with_index do |file, index|
      next unless file.include?('.rb')
      code   = File.read(file)
      begin
        a = eval(code)
      rescue
        a = Exception
      end
      @questions << { q: %x[coderay -ruby #{file}], a: a }
    end
  end

  def loop_questions
    collect_questions
    puts ""
    puts "Welcome!".green
    puts ""
    @questions.each_with_index do |question, i|
      sleep(1)
      puts "==============================="
      puts "Question No: #{i}"
      puts "==============================="
      puts ""
      puts question[:q]
      puts ""
      puts "==============================="
      puts guide
      puts ""
      while answer = Readline.readline("> ", true)
        exit  if answer.gsub(/[\n ]/, '') == 'exit'
        break if answer == 'skip'
        break if match_answer?(answer, question[:a])
        puts "Incorrect. Please Try Again.".red
      end
      puts ""
      puts "Correct!".green
      puts ""
    end
    puts ""
    puts "Congratulations! Well Done!".green
    puts ""
  end

  def loop_methods
    collect_methods
    puts ""
    puts "Welcome!".green
    puts ""
    @questions.each_with_index do |question, i|
      sleep(1)
      puts "==============================="
      puts "Method No: #{i}"
      puts "==============================="
      puts ""
      puts question[:i]
      puts ""
      puts "==============================="
      puts "Fulfill the test cases with an one-line method."
      puts question[:m]
      puts ""
      print "> "
      answer = STDIN.gets.chomp
      next if answer == 'skip'
      exit if answer.gsub(/[\n ]/, '') == 'exit'
      while unfulfilled?(question, answer, i)
        puts question[:i]
        puts "Please Try Again.".red
        puts question[:m]
        puts ""
        print "> "
        answer = STDIN.gets.chomp
        next if answer == 'skip'
        exit if answer.gsub(/[\n ]/, '') == 'exit'
      end
    end
  end

  def unfulfilled?(question, answer, i)
    File.open("#{Rails.root}/tmp/methods/#{i}.rb", "w+") {|file|
      file.write(question[:m].sub("# Your code goes here...", answer))
    }
    if method_valid?(i)
      system("cd #{Rails.root} && rspec spec/lib/methods/#{i}_spec.rb")
      message = %x[cd #{Rails.root} && rspec spec/lib/methods/#{i}_spec.rb]
      return false if message.include?('examples, 0 failures')
    end
    true
  end

  def method_valid?(i)
    begin
      eval(File.read("#{Rails.root}/tmp/methods/#{i}.rb"))
    rescue SyntaxError => e
      puts "#{"SyntaxError".colorize(:red)}: #{e.message}"
      return false
    end
    true
  end

  def collect_methods
    Dir["#{Rails.root}/lib/#{@dir}/**/*"].each_with_index do |file, index|
      next unless file.include?('.rb')
      code        = File.read(file).split("# method")
      instruction = code[0]
      method      = code[1].sub("# code", "# Your code goes here...")
      @questions << { i: instruction, m: method, f: file }
    end
  end

  protected

    def loop_answers(answer, question)
      while not_match?(answer, question[:a])
        puts "Incorrect. Please Try Again.".red
        print "> "
        answer = STDIN.gets.chomp
        break if answer.gsub(/[\n ]/, '') == 'skip'
        exit if answer.gsub(/[\n ]/, '') == 'exit'
      end
    end

    def guide
      "What's the returned value? (Type #{"Exception".colorize(:red)} if you expect an exception)"
    end

    def match_answer?(input, answer)
      begin
        input = eval(input)
      rescue Exception
        return false
      end
      input == answer
    end
end
