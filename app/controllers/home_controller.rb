require 'prismic'

class HomeController < ApplicationController
	include BaseController

  def index
    @blog_post_docs = ContentLoader.current.query_documents('document.type', 'blog-post')
  end

end
