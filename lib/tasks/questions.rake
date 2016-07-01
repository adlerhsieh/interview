task questions: :environment do
	require_relative "../console/console/question"
	Console::Question.new.loop
end
