require_relative '../lib/player'
require_relative '../lib/game'

describe Player do
  before(:each) do
    @player_a = Player.new
    @player_b = Player.new
  end

  context "un solo juego" do
    it  "tijera contra papel" do
      #Player a escoge Tijera
      #Player b escoge Papel
      game = Game.new(@player_a, @player_b)
      game.confront
      game.score(@player_a).should == 1
      game.score(@player_b).should == 0
    end

    it "tijera contra piedra"
    it "tijera contra lagarto"
    it "tijera contra spock"
    it "tijera contra tijera"
  end

  context "partido a mejor de 3" do
    it "jugador 1 gana 2 seguidos"
    it "jugador 1 gana 2 y jugador 2 gana uno"
    it "jugador 1 gana 1 y jugador 2 gana dos"
  end

  context "partido a mejor de 5" do
    it "jugador 1 gana 3 partidos seguidos"
    it "jugador 1 gana 3 partidos y jugador 2 gana dos"
    it "jugador 1 gana 2 prtidos y jugador 2 gana tres"
    it "jugador 2 gana 3 partidos seguidos"
  end
end
