#!/usr/bin/env ruby

#
begin
  
  toRead = ARGV[0]
  toWrite = ARGV[1]
  
  file = File.open(toRead, "r")
  while (line = file.gets)
    
    parsed = line.scan(/\S\D+[a-zA-Z]/)
    parsed |= line.scan(/\d+/)
    
    puts "Country.create(:name => \"" + parsed[0] + "\", :code => \"" + (parsed[1] == nil ? "0" : parsed[1]) +"\")"

  end

  file.close

rescue => err
  puts "Exception: #{err}"
  err
end