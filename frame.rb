class Frame

  
  NO_PINS = 0
  MAX_PINS = 10
  NO_TRY = 0
  TRIES_PER_FRAME = 2 

  def score
    @pins_down
  end

  def initialize
    @pins_down=NO_PINS
    @tries= NO_TRY
  end

  def strike? 
    @pins_down == MAX_PINS
  end

  def anotate pins_down
    increment_tries
    @pins_down+=pins_down
  end

  def full?
    @tries >= TRIES_PER_FRAME
  end
  
  private
  def increment_tries
    @tries += 1
  end
end