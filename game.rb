class Game

  def initialize
    @rolls = Frame.new
  end
  
  def roll pins_down
    @rolls.anotate pins_down      
  end

  def score
    scorer = Scorer.new
    @rolls.accept scorer
    return scorer.score
  end

end