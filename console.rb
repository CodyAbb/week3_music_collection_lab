require('pry')
require_relative('models/albums')
require_relative('models/artists')

  Album.delete_all()
  Artist.delete_all()


artist1 = Artist.new({
  'stage_name' => 'Nirvana'
  })

  artist1.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Nevermind',
  'genre' => 'Grunge'
  })

  album1.save()

binding.pry
nil
