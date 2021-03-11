require 'minitest/autorun'
require 'una'

class CardTest < Minitest::Test
  def setup
    @card = Una::Card.new()
    @card_with_valid_params = Una::Card.new(color: "green", number: 4, type: "number")
  end
  
  def test_check_for_valid_color
    assert_includes(["blue", "green", "red", "yellow"], @card.color) 
  end

  def test_check_for_valid_number
    assert_includes(0..9, @card.number)
  end

  def test_check_for_valid_number_type_pairing
    if @card.number != nil && @card.class == Integer
      assert_equal(@card.type, "number")
    end
  end
end
