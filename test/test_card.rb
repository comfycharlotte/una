require 'minitest/autorun'
require 'una'

class CardTest < Minitest::Test
  def setup
    @card = Una::Card.new()
  end

  def test_check_for_valid_color
    assert_includes(["blue", "green", "red", "yellow"], @card.color) 
  end

  def test_check_for_valid_value
    assert_includes(0..9, @card.value)
  end
end
