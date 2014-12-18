json.array!(@scribbles) do |scribble|
  json.extract! scribble, :id
  json.url scribble_url(scribble, format: :json)
end
