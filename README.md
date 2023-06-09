# Chess Knight Moves

This repository contains two Ruby classes: `ChessBoard` and `Knight`. The `ChessBoard` class represents a chessboard and provides methods to find the shortest path for a knight to move from one position to another. The `Knight` class represents a knight piece on the chessboard.

## Usage

To use the `ChessBoard` class and find the shortest path for a knight to move from a starting position to a destination position, follow these steps:

1. Require the necessary files:
   ```ruby
   require_relative 'knight'
   ```

2. Create an instance of the `ChessBoard` class:
   ```ruby
   board = ChessBoard.new
   ```

3. Print the initial state of the chessboard:
   ```ruby
   board.print_board
   ```

4. Call the `knight_moves` method on the `ChessBoard` instance, providing the starting and destination positions as arguments:
   ```ruby
   board.knight_moves([start_x, start_y], [destination_x, destination_y])
   ```

5. The method will calculate the shortest path and print the intermediate steps on the chessboard, with a delay of 1 second between each step. Finally, it will print the total number of moves and the path from the starting position to the destination position.

## Classes

### `ChessBoard`

The `ChessBoard` class represents a chessboard.

#### Public Methods

- `initialize`: Initializes a new instance of the `ChessBoard` class. It creates an 8x8 grid representing the chessboard.

- `knight_moves(start, destination)`: Finds the shortest path for a knight to move from the `start` position to the `destination` position on the chessboard. It prints the intermediate steps on the chessboard and the final path.

- `make_tree(start, destination)`: Creates a tree of possible moves for the knight using the breadth-first search algorithm. Returns the node representing the `destination` position if a valid path exists, or `nil` otherwise.

- `make_history(current, history, start)`: Creates a history of moves by traversing from the `current` node to the `start` node. Stores the moves in the `history` array.

- `print_history(history, start, destination)`: Prints the total number of moves and the path from the `start` position to the `destination` position based on the `history` array.

- `print_board`: Prints the current state of the chessboard.

### `Knight`

The `Knight` class represents a knight piece on the chessboard.

#### Public Methods

- `initialize(location, parent = [])`: Initializes a new instance of the `Knight` class with the specified `location` on the chessboard. The optional `parent` argument is used to keep track of the parent node in the tree.

- `possible_moves(loc, results = [])`: Calculates the possible moves for a knight from the given `loc` position on the chessboard. Returns an array of valid move positions.

- `move_dir`: Returns an array of all possible knight move directions.

- `to_s`: Returns the string representation of the knight piece (unicode character for knight: ♞).
