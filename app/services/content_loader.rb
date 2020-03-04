require 'prismic'

class ContentLoader
  @@singleton_content_loader=nil

  def initialize(api_url)
    @prismic_api = Prismic.api(api_url)
  end

  def byUID(document_type, uid)
    @prismic_api.getByUID(document_type, uid)
  end

  def query_at(identify_by, term, orderings: [])
    @prismic_api.query(
      Prismic::Predicates.at(identify_by, term),
      { 'orderings' => orderings.to_s.gsub('"', '') }
    ).results
  end

  def self.default
    api_url = ENV.fetch('PRISMIC_URL')
    return @@singleton_content_loader if @@singleton_content_loader
    
    @@singleton_content_loader = ContentLoader.new(api_url)
  end

end
