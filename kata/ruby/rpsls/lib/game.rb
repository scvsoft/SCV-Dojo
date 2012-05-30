class Game

  @@results = {:tijera => {:papel => 1,
                           :piedra => 0,
                           :lagarto => 1,
                           :spock => 0},
                           :piedra => {:tijera => 1},
                           :spock => {:tijera => 1}
  }

  def initialize(player1, player2, matches = 3)     
    @scores = {player1 => 0, 
               player2 => 0   }
    @player1 = player1
    @player2 = player2
    @matches = matches
  end

  def confront
    raise Exception if finished?
    return if ( @player1.selection == @player2.selection )

    do_confront(@player1, @player2)
    do_confront(@player2, @player1)
  end

  def score(player)
    @scores[player]
  end

  def winner
    @winner
  end

  def finished?
    !@winner.nil?
  end

  private

  def do_confront(player, rival)
    increment = @@results[player.selection][rival.selection] rescue 0
    @scores[player] += increment
    if( @scores[player] > @matches/2)
      @winner = player
    end
  end

end
