require './game'

describe "The Bowling Game" do

  @game
  ANY_ROLL=3
  STRIKE =10

  before do
    @game=Game.new
  end

  it "scores pins " do
    @game.roll(ANY_ROLL)
    expect(@game.score()).to eq(ANY_ROLL)
  end

  it "scores the second try too " do
    number_of_rolls = 2
    @game.roll(ANY_ROLL)
    @game.roll(ANY_ROLL)
    expect(@game.score()).to eq(ANY_ROLL*number_of_rolls)
  end

  it "scores a spare" do
    @game.roll(ANY_ROLL)
    @game.roll(STRIKE-ANY_ROLL)
    @game.roll(ANY_ROLL)
    expect(@game.score()).to eq(16)
  end

  it "scores a strike" do
    @game.roll(STRIKE)
    @game.roll(ANY_ROLL)
    @game.roll(ANY_ROLL)
    expect(@game.score()).to eq(22)
  end

  it "scores the next frame" do
    @game.roll(4)
    @game.roll(ANY_ROLL)
    @game.roll(ANY_ROLL)
    @game.roll(ANY_ROLL)
    expect(@game.score()).to eq(13)
  end

end