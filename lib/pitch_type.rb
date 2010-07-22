class PitchType < ActiveRecord::Base
  
  
  def self.text(code)
    case code
    when 'FS'
      'Splitter'
    when 'SL'
      'Slider'
    when 'FF'
      'Fastball' # 4 seam
    when 'FT'
      'Fastball' # 2 seam
    when 'SI'
      'Sinker'
    when 'CH'
      'Change'
    when 'FA'
      'Fastball'
    when 'CU'
      'Curve'
    when 'FC'
      'Cutter'
    when 'KN'
      'Knuckle'
    when 'KC'
      'Knuckle Curve'
    else
      code
    end
  end
  
  
end
