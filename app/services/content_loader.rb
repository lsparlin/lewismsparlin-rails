require 'prismic'

class ContentLoader
  @@semaphore=Mutex.new
  @@singleton_content_loader=nil

  def self.default
    @@semaphore.synchronize do
      return @@singleton_content_loader if @@singleton_content_loader && !@@singleton_content_loader.expired?
      
      @@singleton_content_loader = self.loader_with_latest_api_ref
    end
  end

  def self.loader_with_latest_api_ref
    temp_api = Prismic.api ENV.fetch('PRISMIC_URL')
    return @@singleton_content_loader.refreshed if @@singleton_content_loader && @@singleton_content_loader.master_ref == temp_api.master.ref
    ContentLoader.new(temp_api) 
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
    Time.now > @fetch_time + (ENV.fetch('PRISMIC_EXPIRE_MIN') { 5 }).to_i.minutes
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

end
