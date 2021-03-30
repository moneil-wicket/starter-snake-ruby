# This function is called on every turn of a game. It's how your Battlesnake decides where to move.
# Valid moves are "up", "down", "left", or "right".
# TODO: Use the information in board to decide your next move.
def move(data)
  @data = data
  puts data

  # Choose a random direction to move in
  move = possible_moves.sample
  puts "MOVE: " + move
  { "move": move }
end

def possible_moves
  arr = ['up', 'down', 'left', 'right']
  board_bounds(arr)
end

def board_bounds(arr)
  moves = arr
  moves.delete('left') if @data[:you][:head][:x] == 0
  moves.delete('right') if @data[:you][:head][:x] == @data[:board][:width]
  moves.delete('down') if @data[:you][:head][:y] == 0
  moves.delete('up') if @data[:you][:head][:y] == @data[:board][:width]
  
  moves
end