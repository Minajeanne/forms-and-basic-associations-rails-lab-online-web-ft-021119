class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name #if !!self.genre
    #byebug
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if !!self.artist
  end

  def note_contents=(notes)
    notes.each do |content|
      if !content.strip.empty?
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.collect {|note| note.content}
  end
end
