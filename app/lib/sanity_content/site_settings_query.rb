class SanityContent::SiteSettingsQuery < Sanity::Resource
  queryable

  class << self
    def find_only
      where(groq: query).dig("result")
    end

    def query
      <<-GROQ
      *[_type == 'siteSettings'][0] {
        #{fields}
      }
      GROQ
    end

    def fields
      <<-GROQ
      _id,
      _type,
      _createdAt,
      title,
      subtitle,
      bio,
      description,
      keywords,
      twitter_account,
      "og_image_url": og_image.asset->url,
      socialLinks[] {
        title,
        url,
        "icon_url": icon.asset->url,
      },
      GROQ
    end
  end
end
