require 'digest'
require 'byebug'
require 'colorize'

class Block
  NUM_ZEROES = 4

  def self.create_genesis_block
    Block.new(nil, "Genesis")
  end

  attr_reader :prev_block_hash, :current_block_hash

  def initialize(prev_block, msg)
    @prev_block = prev_block
    @prev_block_hash = prev_block.current_block_hash if prev_block
    @msg = msg
    @nonce = find_nonce
  end

  def hash(message)
    Digest::SHA256.hexdigest(message)
  end

  def find_nonce
    nonce = "HELP IM STUCK IN A NONCE FACTORY!"

    until hash(block_contents + nonce).start_with?("0" * NUM_ZEROES)
      nonce = nonce.next
    end

    calc_new_hash(nonce)
    nonce
  end

  def block_contents
    [@msg, @prev_block_hash].join
  end

  def calc_new_hash(nonce)
    data = [@msg, @prev_block_hash, nonce].join
    @current_block_hash = hash(data)
  end

  def inspect
    puts "prev_block_hash: #{@prev_block_hash}"
    puts "message: #{@msg}".red
    puts "nonce: #{@nonce}".yellow
    puts "curr_block_hash: #{@current_block_hash}"
  end
end

p genesis_block = Block.create_genesis_block
p first_block = Block.new(genesis_block, "First block")
p second_block = Block.new(first_block, "Second block")
