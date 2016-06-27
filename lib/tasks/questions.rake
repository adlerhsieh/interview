task questions: :environment do
	require 'colorize'
	puts ""
	puts "Welcome!".green
	puts ""
	questions = []
	Dir["#{Rails.root}/lib/questions/**/*"].each_with_index do |file, index|
		next unless file.include?('.rb')
		code   = File.read(file)
    begin
      a = eval(code)
    rescue
      a = Exception
    end
    questions << { q: code, a: a }
	end

	def not_match?(input, answer)
		begin
			input = eval(input)
		rescue Exception
			return true
		end
    input != answer
	end

	questions.each_with_index do |question, i|
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
		print "> "
		answer = STDIN.gets.chomp
		next if answer == 'skip'
		exit if answer.gsub(/[\n ]/, '') == 'exit'
		# while not_match?(answer.gsub(/[\n ]/, ''), question[:a])
		while not_match?(answer, question[:a])
			puts "Incorrect. Please Try Again.".red
			print "> "
			answer = STDIN.gets.chomp
      next if answer == 'skip'
			exit if answer.gsub(/[\n ]/, '') == 'exit'
		end
		puts ""
		puts "Correct!".green
		puts ""
	end
end
