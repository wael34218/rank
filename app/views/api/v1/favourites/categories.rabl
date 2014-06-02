node :favourite_categories do
  @favourite_categories.map do |category|
    partial("api/v1/favourites/category", object: category)
  end
end
