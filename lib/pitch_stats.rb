
class PitchStats
  
  
  attr_accessor :pitches
  
  
  def initialize(pitches)
    @pitches = pitches  
  end
  
  
  # Returns an array of pitches that are strikes from the pitches associated with this object
  def strikes
    @pitches.select{|pitch| pitch.outcome == 'S'}
  end
  
  
  # Returns an array of pitches that are balls from the pitches associated with this object
  def balls
    @pitches.select{|pitch| pitch.outcome == 'B'}
  end
  
  
  # Returns an array of pitches that are inplay from the pitches associated with this object
  def inplay
    @pitches.select{|pitch| pitch.outcome == 'X'}
  end
  
  
  # Returns the number of pitches associated with this object.
  def count
    @pitches.size
  end
  
  
  # Returns an array of the pitches of the specified type
  # type should be 'FF', 'KN', etc
  def of_type(type)
   @pitches.select{|pitch| pitch.pitch_type == type}
  end
  
  
  # Returns the average start speed of the pitches associated with this object
  def avg_speed
    if @pitches.length > 0
      @pitches.collect(&:start_speed).sum.to_f/@pitches.length
    else
      0
    end
  end
  
  
  # Returns the maximum speed of the pitches associated with this object.
  def max_speed
    if @pitches.size > 0
      return (@pitches.max {|a,b| a.start_speed.to_f <=> b.start_speed.to_f }).start_speed
    end
    return 0
  end
  
  
  # Returns the minimum speed of the pitches associated with this object.
  def min_speed
    if @pitches.size > 0
      return (@pitches.min {|a,b| a.start_speed.to_f <=> b.start_speed.to_f }).start_speed
    end
    return 0
  end
  
  
end