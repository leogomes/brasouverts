#!/usr/bin/env ruby

begin
  
  toRead = ARGV[0]
  
  file = File.open(toRead, "r")

  while (line = file.gets)
    
    parsed = line.scan(/\S\D+[a-zA-Z]/)
    parsed |= line.scan(/\d+/)

    capitalized = ""
    
    parsed[0].split.each { |word|

      word.capitalize!

      if ((index = word.rindex'\'') != nil)
        word = word[0..index] + word[index+1, word.length].capitalize
      end

      capitalized += word + " "

    }

    capitalized.strip!
    
    puts "City.create(:name => \"" + capitalized + "\", :code => \"" + (parsed[1] == nil ? "0" : parsed[1]) +"\")"

  end

  file.close

rescue => err
  puts "Exception: #{err}"
  err
end