json.array!(@links) do |link|
  json.extract! link, :id, :given_url, :uuid, :code
  json.url link_url(link, format: :json)
end
