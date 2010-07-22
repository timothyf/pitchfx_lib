class Game < ActiveRecord::Base
  
  #set_primary_key :game_id
  #set_inheritance_column :_type_disabled
  
  has_many :atbats
  belongs_to :umpire, :foreign_key => 'umpire_hp_id'
  
  
  belongs_to :home, :class_name => 'Team', :foreign_key => 'home_id'
  belongs_to :away, :class_name => 'Team', :foreign_key => 'away_id'
  
  def pitchers
    pitcher_ids = self.atbats.map{|atbat| atbat.pitcher }
    uniq_ids = pitcher_ids.uniq
    puts '####################################'
    uniq_ids.each do |id|
      puts 'ID = ' + id.to_s
    end
    puts '####################################'
    @pitchers = uniq_ids.map{|id| Player.find(id)}
    return @pitchers
  end
  
  
  def home_pitchers
    
  end
  
  
  def away_pitchers
    
  end

  
end
