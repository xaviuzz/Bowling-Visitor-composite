class Game
  MAX_SCOREABLE_FRAME = 10
  ARRAY_BASE = 0
  ARRAY_BASE_CORRECTION = -1

  def initialize
    @rolls = Frame.new
  end
  
  def roll pins_down
    @rolls.anotate pins_down      
  end

  def score
    scores + bonuses
  end
  
  private

  def scores
    @frames = @rolls.as_frames
    total = 0
    @frames.each_with_index do |frame, index|
      break unless scoreable?(index) || frame.strike?
      total += frame.score
    end
    total
  end

  def bonuses
    @frames = @rolls.as_frames
    total = 0
    @frames.each_with_index do |frame, index| 
      break if last_frame?(index)
      total += compute_next_two_rolls(index) if frame.strike?
      total += next_frame(index).spare_bonus if frame.spare?
    end
    total
  end

  def last_frame? index
    next_frame(index).nil?
  end

  def next_frame index
    @frames[index + 1] 
  end

  def compute_next_two_rolls index
    total = next_frame(index).score
    if (next_frame(index).strike?)  
      total += compute_next_roll(index + 1)
    end
    total
  end

  def compute_next_roll index
    return 0 if next_frame(index).nil? 
    next_frame(index).spare_bonus
  end


  def scoreable? index
    index <= (MAX_SCOREABLE_FRAME + ARRAY_BASE_CORRECTION)
  end
end