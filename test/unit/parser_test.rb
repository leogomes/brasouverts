$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'

class Parser_test < Test::Unit::TestCase

  def test_parse

    text = " Arabia Saudita	00"
    expected = ["Arabia Saudita", "00"]
    parsed_text = text.scan(/\S\D+[a-zA-Z]/)
    parsed_text |= text.scan(/\d+/)

    assert_equal expected, (parsed_text)
  end

  def test_capitalize

    text = " CAP D'AIL	"
    expected = ["Cap D'Ail"]
    
    parsed_text = text.scan(/\S\D+[a-zA-Z]/)
    capitalized = ""
    
    parsed_text[0].split.each { |word|

      word.capitalize!

      if ((index = word.rindex'\'') != nil)
        word = word[0..index] + word[index+1, word.length].capitalize
      end

      capitalized += word + " "
    }

    parsed_text[0] = capitalized.strip!
    assert_equal expected, (parsed_text)
  end
  
end

