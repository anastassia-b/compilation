require 'yaml'
require_relative 'board'

class MinesweeperGame

  def initialize(size)

  end

  def play

  end

  private

  def get_move

  end

  def perform_move(action_type, pos)

  end

  def save

  end
end

if $PROGRAM_NAME == __FILE_
  case ARGV.count
  when 0
    MinesweeperGame.new(:small).play
  when 1
    YAML.load_file(ARGV.shift).play
  end
end
