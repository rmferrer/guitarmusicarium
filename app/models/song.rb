class Song < ActiveRecord::Base
  NOTES = ['A']

  before_create :upcase_tuning

  def tuning
    parse_tuning(self.raw_tuning)
  end

  def tuning=(tuning)
    self.raw_tuning = tuning.is_a?(String) ? tuning : tuning.join('')
  end

  def tuning_distance(other_song)
    if other_song.tuning.size != self.tuning.size
      raise ArgumentError.new("Only numbers are allowed")
    end

    if self.tuning == other_song.tuning
      return 0
    end

    num_strings_different = 0
    semitone_distance = 0
    (0...self.tuning.size).each do |i|
      next if self.tuning[i] == other_song.tuning[i]
      num_strings_different += 1
      semitone_distance = compute_semitone_distance(self.tuning[i], other_song.tuning[i])
    end 
  end

  private 

  def upcase_tuning
    self.tuning = self.tuning.upcase
  end

  def compute_semitone_distance(note_A, note_B)

  end

  def parse_tuning(tuning_s)
    result = []
    while(tuning_s.present?)
      if tuning_s[1].present? and tuning_s[1] == "#"
        result << tuning_s[0..1]
        tuning = tuning_s[2..-1]
        puts tuning
        puts result
      else
        result << tuning_s[0]
        tuning = tuning_s[1..-1]   
        puts tuning
        puts result     
      end
    end
    return result
  end
end
