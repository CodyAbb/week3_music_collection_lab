require('pry')
require_relative('models/albums')
require_relative('models/artists')

  Album.delete_all()
  Artist.delete_all()


artist1 = Artist.new({
  'stage_name' => 'Nirvana'
  })

artist2 = Artist.new({
  'stage_name' => 'Smashing Pumpkins'
  })

  artist1.save()
  artist2.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Nevermind',
  'genre' => 'Grunge'
  })

  album2 = Album.new({
    'artist_id' => artist2.id,
    'title' => 'Mellon Collie',
    'genre' => 'alternative'
    })

  album3 = Album.new({
    'artist_id' => artist1.id,
    'title' => "MTV Unplugged",
    'genre' => "acoustic"
    })

  album1.save()
  album2.save()
  album3.save()

binding.pry
nil
