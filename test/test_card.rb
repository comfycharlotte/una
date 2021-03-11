require 'minitest/autorun'
require 'una'

class CardTest < Minitest::Test
  def setup
    @card = Una::Card.new()
    @card_with_valid_params = Una::Card.new(color: "green", number: 4)
    @card_with_invalid_params = Una::Card.new(number: 2, type: "+2")
  end

  def test_cards_print_properly
    p @card
    p @card_with_valid_params
    p @card_with_invalid_params
  end
  
  def test_check_for_valid_color
    assert_includes(["blue", "green", "red", "yellow"], @card.color) 
  end

  def test_check_for_valid_value
    assert_includes(0..9, @card.number)
  end

  def test_check_for_valid_value_type_pairing
    if @card.number != nil && @card.class == Integer
      assert_equal(@card.type, "number")
    end
  end
end
