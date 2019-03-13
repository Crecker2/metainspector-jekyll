require 'jekyll'
require 'metainspector'

module MetainspectorJekyll
  class Generator < Jekyll::Generator
    safe true
    priority :lowest

    # Main plugin action, called by Jekyll-core
    def generate(input)
      @page = Metainspector.new(input)
      Generator.output.description = @page.best_description
      Generator.output.photo = @page.images.best
      Generator.output.title = @page.best_title
      Generator.output.author = @page.best_author
      return @page_photo
    end
  end
end
