json.array!(@notes) do |note|
  json.extract! note, :id, :title, :body, :raw_body
  json.url note_url(note)
end
