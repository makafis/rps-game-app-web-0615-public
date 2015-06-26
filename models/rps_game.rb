class RPSGame

  attr_accessor :computer_move, :user_move
  @@possible_moves = [:rock, :paper, :scissors]
  PlayTypeError = "Not the correct move. Type in either rock, paper, or scissors"
  
  def initialize(move)
    is_error?(move)
  end

  def is_error?(move)
    if @@possible_moves.include?(move.to_sym)
      @user_move = move.to_sym
    else
      raise PlayTypeError
    end
  end

  def self.valid_play?(move)
    if @@possible_moves.include?(move)
      true
    else
      false
    end
  end

  def computer_play
    random = rand(2)
    @@possible_moves[random]
  end

  def won?
     @computer_move = computer_play
    if @user_move == @computer_move
      false
    elsif (@user_move == :rock && @computer_move == :scissors) || (@user_move == :scissors && @computer_move == :paper) || (@user_move == :paper && @computer_move == :rock)
      true
    elsif (@computer_move == :rock && @user_move == :scissors) || (@computer_move == :scissors && @user_move == :paper) || (@computer_move == :paper && @user_move == :rock)
      false
    end
  end

  def tied?
    @computer_move = computer_play
    if @user_move == @computer_move
      true
    else
      false
    end
  end

  def lost?
    @computer_move = computer_play
     if @user_move == @computer_move
      false
    elsif (@user_move == :rock && @computer_move == :scissors) || (@user_move == :scissors && @computer_move == :paper) || (@user_move == :paper && @computer_move == :rock)
      false
    elsif (@computer_move == :rock && @user_move == :scissors) || (@computer_move == :scissors && @user_move == :paper) || (@computer_move == :paper && @user_move == :rock)
      true
    end
  end

end
