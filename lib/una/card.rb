class Una::Card
  attr_accessor :color, :value
  # variable `params` is a hash, containing symbols that represent attributes of a Card instance
  def initialize(params={color: nil, value: nil})
    acceptable_colors = ["blue", "green", "red", "yellow"]
    if params[:color] != nil
      unless acceptable_colors.include?(params[:color])
        raise ArgumentError.new("Not a valid color") 
      end
      @color = params[:color]
    else
      @color = acceptable_colors.sample
    end
    if params[:value] != nil
      # will be changed to include +2 and +4 at some point
      unless (0..9).include?(params[:value])
        raise ArgumentError.new("Not a valid value")
      end
    else
      @value = (0..9).to_a.sample
    end
  end
end
