json.extract! song, :id, :disc_id, :song_no, :song_name, :created_at, :updated_at
json.url song_url(song, format: :json)
