# A game that can be played by two human players or against a computer on the command line.
# The board is a 4 X 12 Grid. In a two player game players alternate turns until one
# player is victorious.

#One player becomes the codemaker, the other the codebreaker. The codemaker chooses a 
#pattern of four code pegs. Duplicates are allowed, so the player could even choose four 
#code pegs of the same color.

#The codebreaker tries to guess the pattern, in both order and color, within twelve turns. 
#Each guess is made by placing a row of code pegs on the decoding board. Once placed, the 
#codemaker provides feedback by placing from zero to four key pegs in the small holes of 
#the row with the guess. A colored or black key peg is placed for each code peg from the 
#guess which is correct in both color and position. A white key peg indicates the existence 
#of a correct color code peg placed in the wrong position.

#The codemaker gets one point for each guess a codebreaker makes. An extra point is earned by 
#the codemaker if the codebreaker doesn't guess the pattern exactly in the last guess. 
#(An alternative is to score based on the number of colored key pegs placed.) The winner is 
#the one who has the most points after the agreed-upon number of games are played.

module Mastermind
	#Player needs to keep track of how many wins they have.
	class Player
		attr_reader :name, :wins
		def initialize(name, wins = 0)
			@name = name
			@wins = wins
		end
	end

	class Board
	end

	class Peg
	end

	class Game
	end
end
=BEGIN
classes:
	player
		name
		number of wins

	board
		code
		guesses (stored in an array?)

	peg
		colour

	game
=END