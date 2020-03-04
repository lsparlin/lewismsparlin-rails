class BlogController < ApplicationController

  def show
    @blog_doc = ContentLoader.current.query_at('my.blog-post.uid', params[:id]).first or not_found
    @blog_tags = @blog_doc.tags.select { |t| !t.start_with? 'category-' }
  end

  private

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end
