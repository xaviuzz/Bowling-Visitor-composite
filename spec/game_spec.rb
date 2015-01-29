require './game'
require './frame'
require './scorer'

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
    roll_six_pins_frame
    expect(@game.score()).to eq(6)
  end

  it "scores a spare" do
    roll_spare
    roll_six_pins_frame
    expect(@game.score()).to eq(19)
  end

  it "scores a strike" do
    @game.roll(STRIKE)
    roll_six_pins_frame
    expect(@game.score()).to eq(22)
  end

  it "scores a normal game" do
    @game.roll(STRIKE)
    @game.roll(7)
    @game.roll(3)
    @game.roll(9)
    @game.roll(0)
    @game.roll(STRIKE)
    @game.roll(0)
    @game.roll(8)
    @game.roll(8)
    @game.roll(2)
    @game.roll(0)
    @game.roll(6)
    @game.roll(STRIKE)
    @game.roll(STRIKE)
    @game.roll(STRIKE)
    @game.roll(8)
    @game.roll(1)
    expect(@game.score()).to eq(167)
  end

  it "scores an extended game" do
    @game.roll(STRIKE)
    roll_spare
    roll_six_pins_frame
    @game.roll(STRIKE)
    roll_spare
    roll_six_pins_frame
    roll_six_pins_frame
    roll_six_pins_frame
    roll_six_pins_frame
    roll_spare
    @game.roll(ANY_ROLL)
    expect(@game.score()).to eq(109)
  end

  it "scores a perfect game" do
    @game.roll(STRIKE)
    @game.roll(STRIKE)
    @game.roll(STRIKE)
    @game.roll(STRIKE)
    @game.roll(STRIKE)
    @game.roll(STRIKE)
    @game.roll(STRIKE)
    @game.roll(STRIKE)
    @game.roll(STRIKE)
    @game.roll(STRIKE)
    @game.roll(STRIKE)
    @game.roll(STRIKE)
    expect(@game.score()).to eq(300)
  end

  def roll_six_pins_frame
    @game.roll(ANY_ROLL)
    @game.roll(ANY_ROLL)
  end

  def roll_spare
    @game.roll(ANY_ROLL)
    @game.roll(STRIKE-ANY_ROLL)
  end
end