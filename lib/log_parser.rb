module LogParser
  def parse_log(log: nil)
    return {} unless log
    log_array = log_to_array(log)
    capture_details(log_array)
  end

  private

  def capture_details(log)
    pages_and_views = {}
    log.each do |line|
      next unless /^\/\S+/ =~ line
      pages_and_views[$~.to_s] = [] unless pages_and_views.key?($~.to_s)
      pages_and_views[$~.to_s] << $'.to_s.strip
    end
    pages_and_views
  end

  def log_to_array(log)
    begin
      File.readlines(log)
    rescue
      []
    end
  end
end
