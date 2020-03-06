class HomeController < ApplicationController

  def index
    @blog_post_docs = ContentLoader.default.query_at(
      { 'document.type': 'blog-post' },
      orderings: ['document.first_publication_date desc']
    )
  end

end
