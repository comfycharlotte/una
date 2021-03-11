class Una::Card
  attr_accessor :color, :number, :type

  @@valid_colors = ["blue", "green", "red", "yellow"]
  @@valid_types = ["number", "+2", "+4", "skip", "reverse"]
  @color_weights = {"blue" => 19, "green" => 19, "red" => 19, "yellow" => 19}
  @type_weights = {"skip" => 8, "reverse" => 8, "draw_2" => 8, "draw_4" => 4, "wild" => 4}

  @@random_color = WeightedRandomizer.new(@color_weights)
  @@random_type = WeightedRandomizer.new(@type_weights)
  
  # variable `params` is a hash, containing symbols that represent attributes of a Card instance
  def initialize(params={color: nil, number: nil, type: nil})
    if params[:color] != nil
      unless @@valid_colors.include?(params[:color])
        raise ArgumentError.new("Not a valid color") 
      end
      @color = params[:color]
    else
      @color = @@valid_colors.sample
    end
    
    if params[:number] != nil
      unless (0..9).include?(params[:number])
        raise ArgumentError.new("Not a valid value")
      end
      @number = params[:number]
    else
      @number = (0..9).to_a.sample
    end
    
    if params[:type] != nil
      unless @@valid_types.include?(params[:type])
        raise ArgumentError.new("Not a valid type")
      end
      
      if params[:number].class == Integer
        @type = "number"
      end
    else
      if @number != nil && @number.class == Integer
        @type = "number"
      else
        @type = @@random_type.sample
      end
    end
  end
end
