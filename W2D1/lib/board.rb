class Board
  attr_accessor :cups

  def self.empty_board
    cups = Array.new(14) {[:stone, :stone, :stone, :stone]}
    cups[6] =[]
    cups[13] = []
    cups
  end
  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Board.empty_board
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    removed_stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_idx = start_pos
    until removed_stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      if cup_idx == 6
        @cups[6] << removed_stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << removed_stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << removed_stones.pop
      end
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_idx)
   if ending_idx == 6 || ending_idx == 13
     :prompt
   elsif @cups[ending_idx].count == 1
     :switch
   else
     ending_idx
   end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    @cups[0..5].all? {|cup| cup.empty?} ||
      @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    case @cups[6] <=> @cups[13]
    when -1
      @name2
    when 0
      :draw
    when 1
      @name1
    end
  end
end
