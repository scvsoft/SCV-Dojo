require_relative '../lib/player'
require_relative '../lib/game'

describe Player do
  before(:each) do
    @player_a = Player.new
    @player_b = Player.new
  end

  context "un solo juego" do
    it  "tijera contra papel" do
      game = Game.new(@player_a, @player_b)

      @player_a.choose( :tijera )
      @player_b.choose( :papel )

      game.confront
      game.score(@player_a).should == 1
      game.score(@player_b).should == 0
    end

    it "tijera contra piedra" do
      game = Game.new(@player_a, @player_b)

      @player_a.choose( :tijera )
      @player_b.choose( :piedra )

      game.confront
      game.score(@player_a).should == 0
      game.score(@player_b).should == 1
    end 

    it "tijera contra lagarto" do
      game = Game.new(@player_a, @player_b)

      @player_a.choose( :tijera )
      @player_b.choose( :lagarto )

      game.confront
      game.score(@player_a).should == 1
      game.score(@player_b).should == 0
    end

    it "tijera contra spock" do
      game = Game.new(@player_a, @player_b)

      @player_a.choose( :tijera )
      @player_b.choose( :spock )

      game.confront
      game.score(@player_a).should == 0
      game.score(@player_b).should == 1 
    end
    it "tijera contra tijera" do
      game = Game.new(@player_a, @player_b)

      @player_a.choose( :tijera )
      @player_b.choose( :tijera )

      game.confront
      game.score(@player_a).should == 0
      game.score(@player_b).should == 0
    end
  end

  context "partido a mejor de 3" do
    before(:each) do
      @game = Game.new(@player_a, @player_b, 3)
    end

    it "jugador 1 gana 2 seguidos" do
      @player_a.choose( :tijera )
      @player_b.choose( :papel )

      @game.confront
      @game.score(@player_a).should == 1
      @game.score(@player_b).should == 0

      @player_a.choose( :tijera )
      @player_b.choose( :papel )

      @game.confront
      @game.score(@player_a).should == 2
      @game.score(@player_b).should == 0

      @game.winner.should == @player_a

      lambda { @game.confront }.should raise_exception(Exception)
    end
    it "jugador 1 gana 2 y jugador 2 gana uno" do
      @player_a.choose( :tijera )
      @player_b.choose( :papel )

      @game.confront
      @game.score(@player_a).should == 1
      @game.score(@player_b).should == 0
      @game.finished?.should == false

      @player_a.choose( :tijera )
      @player_b.choose( :piedra )

      @game.confront
      @game.score(@player_a).should == 1 
      @game.score(@player_b).should == 1
      @game.finished?.should == false

      @player_a.choose( :tijera )
      @player_b.choose( :papel )

      @game.confront
      @game.score(@player_a).should == 2
      @game.score(@player_b).should == 1

      @game.finished?.should == true
      @game.winner.should == @player_a

      lambda { @game.confront }.should raise_exception(Exception)
    end

    it "jugador 1 gana 1 y jugador 2 gana dos" do
      @player_a.choose( :tijera )
      @player_b.choose( :papel )

      @game.confront
      @game.score(@player_a).should == 1
      @game.score(@player_b).should == 0
      @game.finished?.should == false

      @player_a.choose( :tijera )
      @player_b.choose( :piedra )

      @game.confront
      @game.score(@player_a).should == 1 
      @game.score(@player_b).should == 1
      @game.finished?.should == false

      @player_a.choose( :tijera )
      @player_b.choose( :spock )

      @game.confront
      @game.score(@player_a).should == 1 
      @game.score(@player_b).should == 2 

      @game.finished?.should == true
      @game.winner.should == @player_b

      lambda { @game.confront }.should raise_exception(Exception)
    end
  end

  context "partido a mejor de 5" do
    before(:each) do
      @game = Game.new(@player_a, @player_b, 5)
    end

    it "jugador 1 gana 3 partidos seguidos" do
      (1..3).each do |i|
        @player_a.choose( :tijera )
        @player_b.choose( :papel )

        @game.confront
        @game.score(@player_a).should == i 
        @game.score(@player_b).should == 0
        @game.finished?.should == false unless i == 3
      end

      @game.finished?.should == true
      @game.winner.should == @player_a

      lambda { @game.confront }.should raise_exception(Exception)
    end

    it "jugador 1 gana 3 partidos y jugador 2 gana dos" do
      (1..2).each do |i|
        @player_a.choose( :tijera )
        @player_b.choose( :spock )

        @game.confront
        @game.score(@player_a).should == 0 
        @game.score(@player_b).should == i
        @game.finished?.should == false
      end
      (1..3).each do |i|
        @player_a.choose( :tijera )
        @player_b.choose( :papel )

        @game.confront
        @game.score(@player_a).should == i 
        @game.score(@player_b).should == 2
        @game.finished?.should == false unless i == 3
      end

      @game.finished?.should == true
      @game.winner.should == @player_a

      lambda { @game.confront }.should raise_exception(Exception)

    end
    it "jugador 1 gana 2 prtidos y jugador 2 gana tres" do
      (1..2).each do |i|
        @player_a.choose( :tijera )
        @player_b.choose( :papel )

        @game.confront
        @game.score(@player_a).should == i 
        @game.score(@player_b).should == 0
        @game.finished?.should == false
      end
      (1..3).each do |i|
        @player_a.choose( :tijera )
        @player_b.choose( :piedra )

        @game.confront
        @game.score(@player_a).should == 2 
        @game.score(@player_b).should == i
        @game.finished?.should == false unless i == 3
      end

      @game.finished?.should == true
      @game.winner.should == @player_b

      lambda { @game.confront }.should raise_exception(Exception)
    end
    it "jugador 2 gana 3 partidos seguidos" do
      (1..3).each do |i|
        @player_a.choose( :tijera )
        @player_b.choose( :piedra )

        @game.confront
        @game.score(@player_a).should == 0 
        @game.score(@player_b).should == i
        @game.finished?.should == false unless i == 3
      end

      @game.finished?.should == true
      @game.winner.should == @player_b

      lambda { @game.confront }.should raise_exception(Exception)
    end    
  end
end
