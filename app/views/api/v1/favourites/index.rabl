node :favourites do
  @favourites.map do |favourite|
    partial("api/v1/favourites/show", object: favourite)
  end
end
