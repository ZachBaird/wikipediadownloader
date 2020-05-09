# frozen_string_literal: true

require 'open-uri'
require 'timeout'

remote_base_url = 'http://en.wikipedia.org/wiki'

start_year = 1900
end_year = 2000

(start_year..end_year).each do |year|
  begin
    rpage = open("#{remote_base_url}/#{year}")
  rescue StandardError => e
    puts "Error: #{e}"
  else
    rdata = rpage.read
  ensure
    puts 'sleeping'
    sleep 5
  end

  File.open("copy-of-#{year}.html", 'w') { |f| f.write(rdata) } if rdata
end
