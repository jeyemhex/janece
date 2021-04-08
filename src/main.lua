require 'game'

-- Start a new game
local game = Game:new()

-- Main game loop
while game.turn ~= "end" do
    game:render()

    -- Get the next move from the player
    local move = ""
    while not game:is_legal_move(move) do
        io.write(game.turn .. " to play, Enter a move: ")
        move = io.read()
    end

    -- Make the move
    game:make_move(move)
end
