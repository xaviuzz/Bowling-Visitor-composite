class Game

  STRIKE = 10
  NO_TRY = 0
  TRIES_PER_FRAME = 2 
  
  def initialize
    reset_tries
    init_frames
  end
  
  def roll pins_down
    increment_tries
    anotate pins_down
    next_frame_when_needed      
  end

  def score
    result = sum_frame_scores
    result += bonuses
    result
  end
  
  private

  def bonuses
    result = 0
    result = @second_frame.score if is_strike(@first_frame.score)
    result
  end

  def sum_frame_scores
    @first_frame.score + @second_frame.score
  end

  def next_frame_when_needed
    if (is_strike(@current_frame.score) || is_full(@current_frame.score))
      @current_frame = @second_frame
    end         
  end

  def anotate pins_down
    @current_frame.score += pins_down
  end

  def increment_tries
    @tries += 1
  end

  def init_frames
    @first_frame=Frame.new
    @second_frame=Frame.new
    @current_frame = @first_frame
  end

  def reset_tries
    @tries = NO_TRY 
  end

  def is_full frame
    return false if @tries < TRIES_PER_FRAME
    reset_tries
    return true
  end

  def is_strike frame
    frame == STRIKE
  end


end

class Frame

  attr_accessor :score
  
  INITIAL_FRAME_SCORE = 0

  def initialize
    @score=INITIAL_FRAME_SCORE
  end

end