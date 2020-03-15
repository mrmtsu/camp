module FavoritesHelper
  def favorite_icon(post, user)
    if user
      if user.favorites.exists?(post: post)
        '<i class="far fa-smile-beam"></i>'
      else
        '<i class="far fa-smile-wink fa-smile-wink-o"></i>'
      end
    end
  end
end
