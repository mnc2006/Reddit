json.array!(@votes) do |vote|
  json.extract! vote, :id, :post_id
  json.url vote_url(vote, format: :json)
end
