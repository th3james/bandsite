class PostSweeper < ActionController::Caching::Sweeper
  observe Post
  
  def after_save(post)
    clear_posts_cache(post)
  end
  
  def after_destroy(post)
    clear_posts_cache(post)
  end
  
  def clear_posts_cache(post)
    expire_fragment "posts-index"
  end
end
