class HomeController < ApplicationController

  def index
    @blog_post_docs = ContentLoader.current.query_documents('document.type', 'blog-post')
  end

end
