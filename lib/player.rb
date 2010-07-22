class Player < ActiveRecord::Base
  
  # opponent atbats for a pitcher
  has_many :pitcher_atbats, :class_name => 'Atbat', :foreign_key => 'pitcher_id'
  
  # atbats for a batter
  has_many :batter_atbats, :class_name => 'Atbat', :foreign_key => 'batter_id'
  
  belongs_to :team
  
  @@pitches = nil
  
  
  def full_name
    first + ' ' + last
  end
  
  
  def pitcher_games
    atbats = Atbat.find_all_by_pitcher_id(gameday_id.to_i)
    games = atbats.collect {|atbat| atbat.game}
    games.uniq
    #games.sort! {|a1,a2| a1.date <=> a2.date}
  end
  
  
  def batter_games
    atbats = Atbat.find_all_by_batter_id(gameday_id.to_i)
    games = atbats.collect {|atbat| atbat.game_id}
    games.uniq
  end
  
  
  def pitch_counts_array_string
    result = "["
    arr = pitch_counts
    arr.each do |count|
      result += count.to_s
      result += ","
    end
    result += "]"
    result
  end
  
  
  # Returns an array of pitch counts for the pitchers games
  def pitch_counts
    games = pitcher_games
    pitches = pitches_for_games(games)
    counts = pitches.collect{|pitches| pitches.size}
    counts
  end
  
  
  # Returns an array of pitch counts for the games specified by
  # an array of games passed in
  def pitches_for_games(games)
    results = []
    games.each do |game|
      results << pitcher_pitches_for_game(game.id)
    end
    results
  end
  
  
  # Returns the number of pitches thrown by a pitcher for the specified game
  def pitcher_pitches_for_game(game)
    if !@@pitches
      atbats = opposing_atbats_for_game(game)
      @@pitches = atbats.collect {|atbat| atbat.pitches}.flatten
    end
    @@pitches
  end
  
  
  # Returns an array of pitches where each element in the array represents the
  # pitches for one inning
  def pitcher_pitches_by_inning(game)
    results = []
    (1..9).each do |inning|
      abs = opposing_atbats_for_inning(game, inning)
      results << abs.collect {|atbat| atbat.pitches}.flatten
    end
    results
  end
  
  
  def opposing_atbats_for_game(game)
    game.atbats.select {|atbat| atbat.pitcher_id == gameday_id.to_i}
  end
  
  
  def opposing_atbats_for_inning(game, inning)
    game.atbats.select {|atbat| (atbat.pitcher_id == gameday_id.to_i) && (atbat.inning == inning)}
  end
  
  
  def strikes_array_string
    result = "["
    arr = strikes_for_all_games
    arr.each do |count|
      result += count.to_s
      result += ","
    end
    result += "]"
    result
  end
  
  
  def strikes_for_all_games
    games = pitcher_games
    strikes = strikes_for_games(games)
    strikes
  end
  
  
  # Returns an array of strike counts for the games specified by
  # an array of game ids passed in
  def strikes_for_games(game_ids)
    results = []
    game_ids.each do |game_id|
      results << strikes_for_game(game_id)
    end
    results
  end
  
  
  # Returns the number of strikes thrown by a pitcher for the specified game
  def strikes_for_game(game)
    pitches = pitcher_pitches_for_game(game)
    stats = PitchStats.new(pitches)
    stats.strikes.size + stats.inplay.size
  end
  
  
  def ks_array_string
    result = "["
    arr = ks_for_all_games
    arr.each do |count|
      result += count.to_s
      result += ","
    end
    result += "]"
    result
  end
  
  
  def ks_for_all_games
    games = pitcher_games
    ks = ks_for_games(games)
    ks
  end
  
  
  # Returns an array of strikeout counts for the games specified by
  # an array of game ids passed in
  def ks_for_games(game_ids)
    results = []
    game_ids.each do |game_id|
      results << ks_for_game(game_id)
    end
    results
  end
  
  
  # Returns the number of strikeouts thrown by a pitcher for the specified game
  def ks_for_game(game)
    atbats = game.atbats.select {|atbat| atbat.pitcher_id == gameday_id.to_i}
    k_atbats = atbats.select {|atbat| atbat.strike == 3} 
    k_atbats.size
  end
  

  def walks_array_string
    result = "["
    arr = walks_for_all_games
    arr.each do |count|
      result += count.to_s
      result += ","
    end
    result += "]"
    result
  end
  
  
  def walks_for_all_games
    games = pitcher_games
    walks = walks_for_games(games)
    walks
  end
  
  
  # Returns an array of walk counts for the games specified by
  # an array of game ids passed in
  def walks_for_games(game_ids)
    results = []
    game_ids.each do |game_id|
      results << walks_for_game(game_id)
    end
    results
  end
  
  
  # Returns the number of walks thrown by a pitcher for the specified game
  def walks_for_game(game)
    atbats = game.atbats.select {|atbat| atbat.pitcher_id == gameday_id.to_i}
    w_atbats = atbats.select {|atbat| atbat.ball == 4} 
    w_atbats.size
  end
  
  
  def pitcher? 
    position == 'P'? true:false
  end
  
  
  def hits
    
  end
  
  
end
