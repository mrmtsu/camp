module BookmarksHelper
  def bookmark_icon(post, user)
    if user
      if user.bookmarks.exists?(post: post)
        '<i class="fa fa-bookmark"></i>'
      else
        '<i class="fa fa-bookmark fa-bookmark-o"></i>'
      end
    end
  end
end
