require('pry')
require_relative('models/albums')
require_relative('models/artists')



artist1 = Artist.new({
  'stage_name' => 'Nirvana'
  })

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Nevermind',
  'genre' => 'Grunge'
  })

binding.pry
nil
