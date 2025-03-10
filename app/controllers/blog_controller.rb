class BlogController < ApplicationController
  def show
    @blog_doc = ContentLoader.default.byUID("blog-post", params[:id]) or not_found
    @blog_tags = @blog_doc.tags.reject(&ContentLoader.default.reject_tags.method(:include?))
  end

  private

  def not_found
    raise ActionController::RoutingError.new("Not Found")
  end
end
