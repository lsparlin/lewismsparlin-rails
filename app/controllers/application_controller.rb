class ApplicationController < ActionController::Base
  before_action :load_header_content

  def load_header_content
    @site_header_doc = ContentLoader.default.query_single('site-header')
    @social_link_docs = ContentLoader.default.query_at({'document.type': 'social-link'})
  end

end
