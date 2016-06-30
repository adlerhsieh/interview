task questions: :environment do
	require_relative "../console/console"
	Console.new('questions').loop_questions
end
