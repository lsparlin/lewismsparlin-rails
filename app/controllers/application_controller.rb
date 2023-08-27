class ApplicationController < ActionController::Base
  before_action :load_site_settings

  def load_site_settings
    @site_settings = SiteSettings.new SanityContent::SiteSettingsQuery.find_only
  end
end
