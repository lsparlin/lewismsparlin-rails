class ApplicationController < ActionController::Base
  before_action :load_header_content, :load_site_settings

  def load_header_content
    # TODO: replace this with Sanity social links
    @social_link_docs = ContentLoader.default.query_at({"document.type": "social-link"})
  end

  def load_site_settings
    @site_settings = SiteSettings.new SanityContent::SiteSettingsQuery.find_only
  end
end
