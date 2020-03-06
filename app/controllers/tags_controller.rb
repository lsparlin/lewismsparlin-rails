class TagsController < ApplicationController

  def show
    @tag = params[:id]
    @tag_docs = ContentLoader.default.query_at(
      { 'document.type': 'blog-post', 'document.tags': [@tag] },
      orderings: ['document.first_publication_date desc'])
  end
end
