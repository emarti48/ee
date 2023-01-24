import random

# Constants
ROWS = 10
COLS = 10
MINES = 10

# Create the game board
board = [['.' for _ in range(COLS)] for _ in range(ROWS)]

# Add mines to the board
mines_pos = random.sample(range(ROWS*COLS), MINES)
for pos in mines_pos:
    row = pos // COLS
    col = pos % COLS
    board[row][col] = '*'

# Count the number of mines around each cell
for row in range(ROWS):
    for col in range(COLS):
        if board[row][col] == '*':
            continue

        count = 0
        for r in range(row-1, row+2):
            for c in range(col-1, col+2):
                if (r >= 0 and r < ROWS and
                        c >= 0 and c < COLS and
                        board[r][c] == '*'):
                    count += 1

        if count > 0:
            board[row][col] = str(count)

# Print the board
for row in board:
    print(' '.join(row))
