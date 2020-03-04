require 'prismic'

class ContentLoader
  @@latest_content_loader=nil

  def initialize(api_key)
    @prismic_api = Prismic.api(api_key)
  end

  def query_at(identify_by, term)
    @prismic_api.query(Prismic::Predicates.at(identify_by, term)).results
  end

  def self.current
    api_url = ENV.fetch('PRISMIC_URL')
    return @@latest_content_loader if @@latest_content_loader
    
    @@latest_content_loader = ContentLoader.new(api_url)
  end

end
