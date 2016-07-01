task methods: :environment do
	require_relative "../console/console/method"
	Console::Method.new.loop
end
