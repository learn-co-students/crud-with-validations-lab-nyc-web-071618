class Song < ActiveRecord::Base
  validates :title, presence:true, uniqueness: {scope: [:artist_name, :release_year]}
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence:true

  with_options if: :released? do |song|
    current_year = Date.today.year
    song.validates :release_year, presence:true, numericality:{less_than_or_equal_to: current_year}
  end

  def released?
    released
  end

end
