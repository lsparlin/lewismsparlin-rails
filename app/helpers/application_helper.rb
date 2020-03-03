module ApplicationHelper

  def title 
    if content_for?(:title)
      "#{content_for :title} | Lewis M Sparlin"
    else
      "#{controller_name.capitalize } | Lewis M Sparlin"
    end
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : @site_header_doc.fragments['description'].blocks.first.text
  end

  def meta_keywords
    content_for?(:meta_keywords) ? content_for(:meta_keywords) : @site_header_doc.fragments['keywords'].blocks.first.text
  end

  def meta_image
    content_for?(:meta_image) ? content_for(:meta_image) : @site_header_doc.fragments['card-image'].main.url
  end

  def meta_twitter_account
    @site_header_doc.fragments['twitter-account'].value
  end

end
