Sanity.configure do |config|
  config.token = ENV["SANITY_TOKEN"]
  config.project_id = ENV["SANITY_PROJECT_ID"]
  config.api_version = "v2021-03-25"
  config.dataset = ENV["SANITY_DATASET"] || "production"
  config.use_cdn = true
end
