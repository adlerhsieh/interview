require_relative '../console'

class Console
  class Question
    def initialize
      @questions = []
      @dir = 'questions'
      collect
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
        puts "What's the returned value? (Type #{"Exception".colorize(:red)} if you expect an exception)"
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

    def match_answer?(input, answer)
      begin
        input = eval(input)
      rescue Exception
        return false
      end
      input == answer
    end
  end
end
