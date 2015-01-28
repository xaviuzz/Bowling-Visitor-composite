class Game

  def initialize
    init_frames
  end
  
  def roll pins_down
    current_frame.anotate pins_down      
  end

  def score
    scores + bonuses
  end
  
  private

  def bonuses
    total=0
    @frames.each_with_index do |frame, index|
      total+=@frames[index+1].score if frame.strike?
      total+=@frames[index+1].spare_bonus if frame.spare?
    end
    total
  end

  def scores
    total=0
    for frame in @frames 
      total+=frame.score
    end
    total
  end

  def current_frame
    if (@frames[@current_index].strike? || @frames[@current_index].full?)
      @frames.push (Frame.new)
      @current_index += 1
    end
    @frames[@current_index]
  end

  def init_frames
    @frames = Array.new
    @frames.push (Frame.new)
    @current_index = 0
  end

end