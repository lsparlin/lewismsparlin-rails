require 'prismic'

class ContentLoader
  @@singleton_content_loader=nil

  def initialize(api_url)
    @prismic_api = Prismic.api(api_url)
  end

  def byUID(document_type, uid)
    @prismic_api.getByUID(document_type, uid)
  end

  def query_at(*term_pairs, orderings: [])
    @prismic_api.query(
      term_pairs.each_slice(2).select { |s| s.size == 2 }.map { |s| Prismic::Predicates.at(s.first, s.last) },
      { 'orderings' => orderings.to_s.gsub('"', '') }
    ).results
  end

  def self.default
    api_url = ENV.fetch('PRISMIC_URL')
    return @@singleton_content_loader if @@singleton_content_loader
    
    @@singleton_content_loader = ContentLoader.new(api_url)
  end

end
