require 'prismic'

class HomeController < ApplicationController

  def index
    pris_api = Prismic.api('https://lewismsparlin.prismic.io/api')

    landing_res = pris_api.query(Prismic::Predicates.at('document.type', 'site-header'))
    social_res = pris_api.query(Prismic::Predicates.at('document.type', 'social-link'))
    blogs_res = pris_api.query(Prismic::Predicates.at('document.type', 'blog-post'))

    @site_header_doc = landing_res.results.first
    @social_link_docs = social_res.results
    @blog_post_docs = blogs_res.results
  end

end
