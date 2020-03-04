class TagsController < ApplicationController

  def show
    @tag = params[:id]
    @tag_docs = ContentLoader.current.query_at('document.tags', [@tag])
  end
end
