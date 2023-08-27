module ApplicationHelper
  def title 
    if content_for?(:title)
      "#{content_for :title} | Lewis M Sparlin"
    else
      "#{controller_name.capitalize } | Lewis M Sparlin"
    end
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : @site_settings.description
  end

  def meta_keywords
    content_for?(:meta_keywords) ? content_for(:meta_keywords) : @site_settings.keywords
  end

  def meta_image
    content_for?(:meta_image) ? content_for(:meta_image) : @site_settings.og_image_url
  end

  def meta_twitter_account
    @site_settings.twitter_account
  end
end
