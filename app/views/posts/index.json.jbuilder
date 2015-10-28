json.array!(@posts) do |post|
  json.extract! post, :id, :title, :area, :address, :desc, :price, :picture, :user_id
  json.url post_url(post, format: :json)
end
