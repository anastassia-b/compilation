require_relative 'PolyTreeNode'

class KnightPathFinder
  attr_reader :visited_positions, :move_tree
  DELTAS = [
    [1,2], [1, -2], [-1,2], [-1,-2], [2,1], [2,-1], [-2,1], [-2,-1]
  ]

  def self.valid_move?(pos)
    row, col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end

  def initialize(start_pos = [0,0])
    @start_pos = start_pos
    @visited_positions = [start_pos]
    @move_tree = build_move_tree(PolyTreeNode.new(@start_pos))
  end

  def new_move_positions(pos)
    row, col = pos
    new_pos = []
    DELTAS.each do |x, y|
      changed_pos = [row + x, col + y]
      new_pos << changed_pos if self.class.valid_move?(changed_pos)
    end

    valid_moves = new_pos.reject {|pos| @visited_positions.include?(pos)}
    @visited_positions += valid_moves
    valid_moves
  end

  def build_move_tree(root_node)
    queue = [root_node]

    until queue.empty?
      current_node = queue.shift
      moves = new_move_positions(current_node.value)
      moves.each do |move|
        child = PolyTreeNode.new(move)
        child.parent = current_node
        queue << child
      end
    end

    root_node
  end

  def find_path(end_pos)
    node = @move_tree.dfs(end_pos)
    path = trace_back_path(node)
    path.reverse
  end

  def trace_back_path(node)
    return [node.value] if node.parent.nil?
    [node.value] + trace_back_path(node.parent)
  end

end
