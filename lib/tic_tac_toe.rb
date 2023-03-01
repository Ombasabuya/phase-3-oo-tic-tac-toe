class TicTacToe
    def initialize
      @board = Array.new(3) { Array.new(3, " ") }
      @current_player = "X"
    end
    
    def print_board
      @board.each_with_index do |row, index|
        puts row.join(" | ")
        puts "---------" unless index == 2
      end
    end
    
    def play
      loop do
        print_board
        puts "Player #{@current_player},enter a row (0-2):"
        row = gets.chomp.to_i
        puts "Player #{@current_player}, enter a column (0-2):"
        col = gets.chomp.to_i
        
        if @board[row][col] == " "
          @board[row][col] = @current_player
          if game_over?
            print_board
            puts "Game ended Player #{@current_player} wins!"
            return
          end
          switch_player
        else
          puts "taken! another one."
        end
      end
    end
    
    private
    
    def switch_player
      @current_player = @current_player == "X" ? "O" : "X"
    end
    
    def game_over?
      # Check rows
      @board.each do |row|
        return true if row.uniq.length == 1 && row[0] != " "
      end
      

      (0..2).each do |col|
        column = @board.map { |row| row[col] }
        return true if column.uniq.length == 1 && column[0] != " "
      end

      diagonal1 = [@board[0][0], @board[1][1], @board[2][2]]
      diagonal2 = [@board[0][2], @board[1][1], @board[2][0]]
      return true if diagonal1.uniq.length == 1 && diagonal1[0] != " "
      return true if diagonal2.uniq.length == 1 && diagonal2[0] != " "
      

      @board.each do |row|
        return false if row.include?(" ")
      end
      
    
      print_board
      puts "Game ended!"
      return true
    end
  end
  
  game = TicTacToe.new
  game.play
  