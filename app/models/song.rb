class Song < ActiveRecord::Base
  validates :title, presence:true
  validates :artist_name, presence:true
  validates_uniqueness_of :title, scope: [:artist_name, :release_year]
   validate :valid_release_year
   def valid_release_year
    return true if released == false
    if release_year == nil || release_year > Date.today.year
      errors.add( :release_year,"invalid release year")
    else
      return true
    end
  end
end
