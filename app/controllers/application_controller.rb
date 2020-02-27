class ApplicationController < ActionController::Base
  before_action :load_header_content

  def load_header_content
    @site_header_doc = ContentLoader.current.query_documents('document.type', 'site-header').first
    @social_link_docs = ContentLoader.current.query_documents('document.type', 'social-link')
  end

end
