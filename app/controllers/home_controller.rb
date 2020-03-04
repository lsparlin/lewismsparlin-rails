class HomeController < ApplicationController

  def index
    @blog_post_docs = ContentLoader.current.query_at('document.type', 'blog-post')
  end

end
