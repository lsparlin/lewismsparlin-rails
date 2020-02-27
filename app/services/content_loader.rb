
class ContentLoader
  @@latest_content_loader=nil

  def initialize(api_key)
    @prismic_api = Prismic.api(api_key)
  end

  def query_documents(identify_by, term)
    @prismic_api.query(Prismic::Predicates.at(identify_by, term)).results
  end

  def self.current
    return @@latest_content_loader if @@latest_content_loader
    
    @@latest_content_loader = ContentLoader.new('https://lewismsparlin.prismic.io/api')
  end

end
