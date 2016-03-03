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
	# the player class will need to state whether the current player is the codebreaker or
	# codemaster. Will use status for this purpose
	class Player
		attr_reader :name, :wins
		attr_accessor :status
		def initialize(name, status, points = 0)
			@name = name
			@points = points
			@status = status
		end
	end

	class Board
		attr_accessor :board
		attr_reader :code
		@@pegs = {:R => "Red", :Y => "Yellow", :B => "Blue", :G => "Green", :O => "Orange", :P => "Pink"}
		def initialize(code)
			@board = []
			@code = code
		end

		def display_board
			@board.each do |row|
				print row.to_s + "\n"
			end
		end

		def self.pegs
			@@pegs
		end
	end

	class Game
		attr_accessor :game_board, :number_of_guesses
		attr_reader :code_array, :player1
		def initialize
			@number_of_guesses = 0
			start_game
		end

		def start_game
			get_player_information
			set_code
			create_board
			intro
			game_loop
		end

		def get_player_information
			puts "Please enter your name:"
			player_name = gets.chomp.capitalize
			create_player(player_name)
		end

		def create_player(name)
			@player1 = Mastermind::Player.new(name, :codebreaker)
		end

		def set_code
			@code_array = []
			4.times {@code_array << Mastermind::Board.pegs.keys.sample}
		end

		def create_board
			@game_board = Mastermind::Board.new(@code_array)
		end

		def game_loop
			@game_won = false
			while !@game_won
				intro
				@game_board.display_board
				puts "#{@player1.name} Please enter your code guess"
				code_guess = gets.chomp.upcase
				while !check_guess_valid(code_guess)
					puts "Your input was not correct. Please try again"
					code_guess = gets.chomp.upcase
					check_guess_valid(code_guess)
				end
			end
		end

		def intro
			puts "The peg colour options are: "
			Mastermind::Board.pegs.each do |key, val|
				puts "#{key.to_s}: #{val}"
			end
			puts "Please enter four colours using the corresponding letter."
			puts "Example. To enter Red, Red, Yellow, Green as an option you should enter RRYG and then press enter"
		end

		def check_guess_valid(code)
			return false if code.length != 4
			code.split("").each do |val|
				return false unless Mastermind::Board.pegs.keys.to_s.include?(val)
			end
			return true
		end
	end
end
=begin
classes:
	player
		name
		points
		status

	board
		pegs that can be chosen randomly
		code (set by computer or another player) and stored in array
		guesses (stored in an array?)
		display_board method to show the current board

	game
		get player information
		start game loop (need to remember number of turns)
		check each turn against the code
		check for a winner
		assign black pegs and/or white pegs
		if there is a winner switch roles
=end

Mastermind::Game.new