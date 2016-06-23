task questions: :environment do
	require 'colorize'
	puts ""
	puts "Welcome!".green
	puts ""
	questions = []
	Dir["#{Rails.root}/lib/questions/**/*"].each_with_index do |file, index| 
		next unless file.include?('.rb')
		code   = File.read(file)
		q      = code.split('====Answer====')[0]
		a      = code.split('====Answer====')[1].split("\n").map {|n| n.gsub(/[\n ]/, '') }
		a.delete("")
		questions << { q: q, a: a }
	end
	
	def not_match?(input, answers)
		answers.any? {|a| a == input }.!
	end

	questions.each_with_index do |question, i|
		sleep(1)
		puts "==============================="
		puts "Question No: #{i}"
		puts "==============================="
		puts ""
		puts question[:q]
		puts "==============================="
		puts "What's the output? (Type 'exception' if you expect an exception)"
		puts ""
		print "> "
		answer = STDIN.gets.chomp
		exit if answer.gsub(/[\n ]/, '') == 'exit'
		while not_match?(answer.gsub(/[\n ]/, ''), question[:a])
			puts "Incorrect. Please Try Again.".red
			print "> "
			answer = STDIN.gets.chomp
			exit if answer.gsub(/[\n ]/, '') == 'exit'
		end
		puts ""
		puts "Correct!".green
		puts ""
	end
end