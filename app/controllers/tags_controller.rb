class TagsController < ApplicationController

  def show
    @tag = params[:id]
    @tag_docs = ContentLoader.current.query_documents('document.tags', [@tag])
  end
end
