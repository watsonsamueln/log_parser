#!/usr/bin/env ruby
require_relative 'lib/server_details.rb'
require_relative 'lib/arg_validator.rb'

single_file = ArgValidator.new(args: ARGV).single_file_given?

if single_file
	results = ServerDetails.new(log: ARGV.first).pageviews
	results.each do |res|
    puts "Page: #{res.page}"
    puts "Total views: #{res.total}"
    puts "Unique views: #{res.unique}\n\n"
	end
else
  puts 'please supply a single filepath argument ending in: .log, .txt or .rb'
end
