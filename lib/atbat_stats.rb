
class AtbatStats
  
  attr_accessor :atbats
  
  def initialize(atbats)
    @atbats = atbats
  end
  
  
  # Returns an array of Atbats that are strikeouts
  def strikeouts
    @atbats.select{|atbat| atbat.strike == 3} 
  end
  
  
  # Returns an array of Atbats that are walks
  def walks
    @atbats.select{|atbat| atbat.ball == 4} 
  end
  
  
  # Returns an array of Atbats that are hits
  def hits
    ip = inplay
    ip.select{|atbat|}
  end
  
  
  # Returns an array of Atbats that are inplay
  def inplay
    @atbats.select{|atbat| atbat.event != 'Strikeout' && atbat.event != 'Walk'} 
  end
  
  
end