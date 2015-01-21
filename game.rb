class Game

  def initialize
    init_frames
  end
  
  def roll pins_down
    @current_frame.anotate pins_down
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
    result = @second_frame.score if @first_frame.strike?
    result
  end

  def sum_frame_scores
    @first_frame.score + @second_frame.score
  end

  def next_frame_when_needed
    if (@current_frame.strike? || @current_frame.full?)
      @current_frame = @second_frame
    end         
  end

  
  def init_frames
    @first_frame=Frame.new
    @second_frame=Frame.new
    @current_frame = @first_frame
  end

  
  


end

