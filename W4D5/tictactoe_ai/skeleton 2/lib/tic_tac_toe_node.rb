require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board            = board
    @next_mover_mark  = next_mover_mark
    @prev_move_pos    = prev_move_pos
  end

  def losing_node?(evaluator)
    
    if board.over?
      # Note that a loss in this case is explicitly the case where the
      # OTHER person wins: a draw is NOT a loss. Board#won? returns
      # false in the case of a draw.
      return board.won? && board.winner != evaluator
    end

    if self.next_mover_mark == evaluator
      # If it's the turn of the 'evaluator', and no matter where we
      # move the opponent can force a loss, then this is already a
      # lost node.
      self.children.all? { |node| node.losing_node?(evaluator) }
    else
      # If it's the opponent's turn, and they have any move where they
      # can eventually force a loss, we assume that the opponent play
      # perfectly and will take that move and eventually beat us.
      self.children.any? { |node| node.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    if board.over?
      return board.won? && board.winner == evaluator
    end
    if self.next_mover_mark == evaluator
      self.children.any? { |node| node.winning_node?(evaluator) }
    else
      self.children.all? { |node| node.winning_node?(evaluator) }
    end
  end
  
  def children
    children = []
    
    (0..2).each do |r|
      (0..2).each do |c|
        pos = [r,c]
        if board.empty?(pos)
          new_board = board.dup
          new_board[pos] =self.next_mover_mark 
          next_mover_mark = (self.next_mover_mark == :x ? :o : :x)
          children << TicTacToeNode.new(new_board, next_mover_mark, pos)
        end
      end
    end
    children
  end
end