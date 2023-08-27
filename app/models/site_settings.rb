class SiteSettings < SanityModel
  attribute :title, :string
  attribute :subtitle, :string
  attribute :bio, :string
  attribute :description, :string
  attribute :keywords, :string
  attribute :twitter_account, :string
  attribute :og_image
  attribute :og_image_url, :string
end
