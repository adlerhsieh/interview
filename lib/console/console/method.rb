require_relative '../console'

class Console
  class Method
    def initialize
      @questions = []
      @dir = 'methods'
      collect
    end

    def loop
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
        while answer = Readline.readline("> ", true)
          exit  if answer.gsub(/[\n ]/, '') == 'exit'
          break if answer == 'skip'
          break if fulfilled?(question, answer, i)
          puts "Please Try Again. Make all tests pass.".red
          puts question[:m]
          puts ""
        end
        puts ""
        puts "Well Done!".green
        puts ""
      end
      puts ""
      puts "Congratulations!".green
      puts ""
    end

    def fulfilled?(question, answer, i)
      File.open("#{Rails.root}/tmp/methods/#{i}.rb", "w+") {|file|
        file.write(question[:m].sub("# Your code goes here...", answer))
      }
      if method_valid?(i)
        system("cd #{Rails.root} && rspec spec/lib/methods/#{i}_spec.rb")
        message = %x[cd #{Rails.root} && rspec spec/lib/methods/#{i}_spec.rb]
        return true if message.include?('examples, 0 failures')
      end
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

    def collect
      Dir["#{Rails.root}/lib/#{@dir}/**/*"].each_with_index do |file, index|
        next unless file.include?('.rb')
        code        = File.read(file).split("# method")
        instruction = code[0]
        method      = code[1].sub("# code", "# Your code goes here...")
        @questions << { i: instruction, m: method, f: file }
      end
    end
  end
end
