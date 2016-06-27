require 'colorize'

class Console
  def initialize(dir)
    @questions = []
    @dir = dir
    collect
  end

  def collect
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

  def loop
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
      print "> "
      answer = STDIN.gets.chomp
      next if answer == 'skip'
      exit if answer.gsub(/[\n ]/, '') == 'exit'
      case @dir
      when 'questions'
        loop_questions(answer, question)
      when 'methods'
        loop_methods
      end
      puts ""
      puts "Correct!".green
      puts ""
    end
    puts ""
    puts "Congratulations! Well Done!".green
    puts ""
  end

  protected

    def colorize(code)
      code.gsub("class ", "class ".colorize(:light_red))
          .gsub("def ", "def ".colorize(:light_red))
          .gsub("end", "end".colorize(:light_red))
    end

    def loop_questions(answer, question)
      while not_match?(answer, question[:a])
        puts "Incorrect. Please Try Again.".red
        print "> "
        answer = STDIN.gets.chomp
        break if answer.gsub(/[\n ]/, '') == 'skip'
        exit if answer.gsub(/[\n ]/, '') == 'exit'
      end
    end

    def loop_methods
      
    end

    def guide
      case @dir
      when 'questions'      
        "What's the returned value? (Type #{"Exception".colorize(:red)} if you expect an exception)"
      when 'methods'
        "Fulfill expectations with an one-line method"
      end
    end

    def not_match?(input, answer)
      begin
        input = eval(input)
      rescue Exception
        return true
      end
      input != answer
    end
end