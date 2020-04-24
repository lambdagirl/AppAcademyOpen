require_relative 'poly_tree_node.rb'
DELTA = [
  [-2, -1],
  [-2,  1],
  [-1, -2],
  [-1,  2],
  [ 1, -2],
  [ 1,  2],
  [ 2, -1],
  [ 2,  1]
]
class KnightPathFinder
  attr_accessor :root_node, :considered_positions, :start_pos
  def initialize(start_pos)
    @start_pos = start_pos
    @considered_positions = [start_pos]

    build_move_tree
  end

  def self.valid_moves(pos)
    valid_moves = []
    x,y = pos
    DELTA.each do |r,c|
      if (r+x).between?(0,7) && (c+y).between?(0,7)
        valid_moves << [r+x,c+y]
      end
    end
    valid_moves
  end

  #bfs
  def build_move_tree
    self.root_node=PolyTreeNode.new(start_pos)
    
    q = [root_node]
    until q.empty?
      node = q.shift
      pos = node.value
      new_move_positions(pos).each do |p|
        next_node = PolyTreeNode.new(p)
        node.add_child(next_node)
        q << next_node
      end
    end
  end

  #
#   Phase III: #find_path
# Now that we have created our internal data structure (the move tree stored in self.root_node), we can traverse it to find the shortest path to any position on the board from our original @start_pos.

# Create an instance method #find_path(end_pos) to search for end_pos in the move tree. You can use either dfs or bfs search methods from the PolyTreeNode exercises; it doesn't matter. This should return the tree node instance containing end_pos.

# This gives us a node, but not a path. Lastly, add a method #trace_path_back to KnightPathFinder.
# This should trace back from the node to the root using PolyTreeNode#parent. As it goes up-and-up toward the root, it should add each value to an array. 
# #trace_path_back should return the values in order from the start position to the end position.

# Use #trace_path_back to finish up #find_path.

# Here are some example paths that you can use for testing purposes (yours might not be exactly the same, but should be the same number of steps);

  def find_path(end_pos)
    node = root_node.dfs(end_pos)

    trace_path_back(node)
      .reverse
      .map(&:value)
  end

  def trace_path_back(node)
    nodes = []
    current_node = node
    until current_node.nil?
      nodes << current_node
      current_node = current_node.parent
    end
    nodes
    
  end

  def new_move_positions(pos)
    KnightPathFinder.valid_moves(pos)
      .reject { |new_pos| considered_positions.include?(new_pos) }
      .each { |new_pos| considered_positions << new_pos }
  end
end


if $PROGRAM_NAME == __FILE__
  kpf = KnightPathFinder.new([0,0])
  p kpf.find_path([5,7])
end