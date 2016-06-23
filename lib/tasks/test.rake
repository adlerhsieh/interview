task questions: :environment do
	puts "Welcome!"
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
		puts "==============================="
		puts "Question No: #{i}"
		puts "==============================="
		puts question[:q]
		puts "==============================="
		puts "What's the output?"
		puts "1) Type the answer or"
		puts "2) Type 'exception' if you expect an exception is raised"
		puts ""
		puts question[:a]
		print "> "
		answer = STDIN.gets.chomp
		exit if answer.gsub(/[\n ]/, '') == 'exit'
		while not_match?(answer.gsub(/[\n ]/, ''), question[:a])
			puts "Wrong Answer. Please Try Again."
			print "> "
			answer = STDIN.gets.chomp
			exit if answer.gsub(/[\n ]/, '') == 'exit'
		end
	end
end