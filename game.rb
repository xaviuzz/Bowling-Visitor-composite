class Game
  MAX_SCOREABLE_FRAME = 10
  ARRAY_BASE = 0
  ARRAY_BASE_CORRECTION = -1

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

  def init_frames
    @frames = Array.new
    @frames.push (Frame.new)
    @current_index = ARRAY_BASE
  end

  def current_frame
    if (new_frame_needed?)
      add_frame
    end
    @frames[@current_index]
  end

  def scores
    total = 0
    @frames.each_with_index do |frame, index|
      break unless scoreable?(index) || frame.strike?
      total += frame.score
    end
    total
  end

  def bonuses
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

  def new_frame_needed?
    @frames[@current_index].strike? || @frames[@current_index].full?
  end

  def add_frame
    @frames.push (Frame.new)
    @current_index += 1
  end
end