task methods: :environment do
	require_relative "../console/console"
	Console.new('methods').loop_methods
end
