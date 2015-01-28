class Frame
  MAX_PINS = 10

  def initialize
    @first= nil
    @second= nil
  end

  def anotate pins_down
    return get_next.anotate pins_down if no_more_rolls?
    record pins_down
  end

  def spare_bonus
    @first
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

  def full?
    !@second.nil?
  end

  def as_frames
    collection = Array.new
    collection.push(self)
    collection = collection + @next.as_frames unless @next.nil?
    collection
  end

  private 

  def no_more_rolls?
    strike? || full?
  end

  def get_next
    @next = ComposableFrame.new if @next.nil?
    return @next
  end

  def record pins_down
    if @first.nil?
      @first=pins_down 
    else
      @second=pins_down
    end 
  end
end