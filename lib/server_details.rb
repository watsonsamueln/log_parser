require_relative 'log_parser.rb'

class ServerDetails
	include LogParser

  def initialize(log: [])
  	@parsed_log = format_log(log: log)
  end

  def pageviews
  	sorted_hash = @parsed_log.sort_by{ |key, val| val }.reverse.to_h
  	sorted_hash.map do |key, value|
  		Struct::Pageview.new(key, value.count, value.uniq.count)
	  end
  end

  private

  Struct.new('Pageview', :page, :total, :unique)

  def format_log(log: {})
		parse_log(log: log)
  end
end
