class BlogController < ApplicationController
  include BaseController

  def show
    @blog_doc = ContentLoader.current.query_documents('my.blog-post.uid', params[:id]).first
  end

end
