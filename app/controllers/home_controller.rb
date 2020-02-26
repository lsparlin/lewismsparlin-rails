require 'prismic'

class HomeController < ApplicationController

  def index
    pris_api = Prismic.api('https://lewismsparlin.prismic.io/api')
    landing_doc = pris_api.query(Prismic::Predicates.at('document.type', 'site-header'))

    @prismic_doc = landing_doc.results.first
  end

end
