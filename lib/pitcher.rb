
class Pitcher < Player
  
  
  # Returns an array of pitch counts for the pitchers games
  def pitch_counts
    games = pitcher_games
    pitches = pitches_for_games(games)
    counts = pitches.collect{|pitches| pitches.size}
    counts
  end
  
  
end