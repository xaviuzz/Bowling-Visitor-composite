class Frame
  MAX_PINS = 10

  def initialize
    @first= nil
    @second= nil
  end
  
  def spare_bonus
    @first
  end

  def first_roll
    spare_bonus
  end

  def score
    @first.to_i + @second.to_i
  end

  def strike? 
    @first == MAX_PINS
  end

  def spare? 
    return false if strike?
    score == MAX_PINS
  end

  def anotate pins_down
    if @first.nil?
      @first=pins_down 
    else
      @second=pins_down
    end 
  end

  def full?
    !@second.nil?
  end
  
end