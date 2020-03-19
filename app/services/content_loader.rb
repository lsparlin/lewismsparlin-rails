require 'prismic'

class ContentLoader

  @@semaphore=Mutex.new
  @@singleton_content_loader=nil

  # Class scoped providers
  class << self

    def default
      @@semaphore.synchronize do
        return @@singleton_content_loader if @@singleton_content_loader && !@@singleton_content_loader.expired?
        
        @@singleton_content_loader = loader_with_latest_api_ref
      end
    end
    
    def excluded_tags
      ENV['PRISMIC_EXCLUDE_TAGS']&.split(/,\s*/) or []
    end

    private

    def loader_with_latest_api_ref
      temp_api = Prismic.api ENV.fetch('PRISMIC_URL')
      return @@singleton_content_loader.refreshed if  @@singleton_content_loader&.master_ref == temp_api.master.ref
      ContentLoader.new(temp_api) 
    end
  end 


  def initialize(api)
    @prismic_api = api
    @fetch_time = Time.now
  end

  def refreshed
    self.class.new(@prismic_api)
  end

  def master_ref
    @prismic_api.master.ref
  end

  def expired?
    Time.now > @fetch_time + ENV.fetch('PRISMIC_EXPIRE_MIN', 5).to_i.minutes
  end

  def reject_tags
    [ *self.class.excluded_tags, *@prismic_api.tags.select { |t| t.start_with? 'category-' } ]
  end

  def byUID(document_type, uid)
    @prismic_api.getByUID(document_type, uid)
  end

  def query_single(document_type)
    @prismic_api.getSingle(document_type)
  end

  def query_at(terms, not_terms: {}, orderings: [])
    raise "Expecting terms to be of type hash; terms=#{terms.inspect}" if !terms.respond_to? :each_pair
    raise "Expecting not_terms to be of type hash; not_terms=#{not_terms.inspect}" if !not_terms.respond_to? :each_pair

    @prismic_api.query([
      *terms&.each_pair.map { |key, value| Prismic::Predicates.at(key, value) },
      *not_terms.each_pair.map { |key, value| Prismic::Predicates.not(key, value) },
      *self.class.excluded_tags.map { |t| Prismic::Predicates.not('document.tags', [t]) }
      ],
      { 'orderings' => orderings.to_s.gsub('"', '') }
    ).results
  end

end
