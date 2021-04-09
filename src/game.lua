#! /usr/bin/env lua
--
-- game.lua
-- Copyright (C) 2021 Edward Higgins <ed.higgins@york.ac.uk>
--
-- Distributed under terms of the MIT license.
--

Game = { }

function Game:new()
    local g = self
    g.turn  = "white"
    g.moves = {}
    g.move = 1

    g.board = {
      a = {"R", "P", " ", " ", " ", " ", "p", "r"},
      b = {"N", "P", " ", " ", " ", " ", "p", "n"},
      c = {"B", "P", " ", " ", " ", " ", "p", "b"},
      d = {"Q", "P", " ", " ", " ", " ", "p", "q"},
      e = {"K", "P", " ", " ", " ", " ", "p", "k"},
      f = {"B", "P", " ", " ", " ", " ", "p", "b"},
      g = {"N", "P", " ", " ", " ", " ", "p", "n"},
      h = {"R", "P", " ", " ", " ", " ", "p", "r"},
    }

    g.pieces = {
      K = {"e1"},
      Q = {"d1"},
      R = {"a1", "h1"},
      N = {"b1", "g1"},
      B = {"c1", "f1"},
      P = {"a2", "b2", "c2", "d2", "e2", "f2", "g2", "h2"},
      K = {"e8"},
      Q = {"d8"},
      R = {"a8", "h8"},
      N = {"b8", "g8"},
      B = {"c8", "f8"},
      P = {"a7", "b7", "c7", "d7", "e7", "f7", "g7", "h7"},
    }

    return g
end

function Game:is_legal_move(move)
    if move == "" then
      return false
    end
    return true
end

function Game:render()
    print(" ")
    for file = 8,1,-1 do
        for rank = 1, 8 do
            if self.turn == "white" then
                piece = self.board[string.char(96+rank)][file]
            else
                piece = self.board[string.char(96+rank)][9-file]
            end

            term_color = "[1"
            if string.byte(piece) < 96 then
                term_color = term_color .. ";97"
            else
                term_color = term_color .. ";30"
            end

            if math.fmod(rank+file, 2) == 0 then
                term_color = term_color .. ";42" 
            else
                term_color = term_color .. ";43" 
            end
            term_color = term_color .. "m"

            io.write(term_color .. piece .. " [1;0m")
        end
        print(" ")
    end
    print()

end

function Game:make_move(move)
    self.moves[#self.moves+1] = move

    if self.turn == "white" then
        self.turn = "black"

    elseif self.turn == "black" then
        self.turn = "white"
        self.move = self.move + 1
    end

    if self.move == 5 then
       self.turn = "end"
    end
end
