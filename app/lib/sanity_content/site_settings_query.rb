class SanityContent::SiteSettingsQuery < Sanity::Resource
  queryable

  def self.find_only
    where(groq: query).dig("result")
  end

  def self.query
    <<-GROQ
  *[_type == 'siteSettings'][0] {
    ...,
    "og_image_url": og_image.asset->url,
    socialLinks[] {
      title,
      url,
      "icon_url": icon.asset->url,
    },
  }
    GROQ
  end
end
