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

end

