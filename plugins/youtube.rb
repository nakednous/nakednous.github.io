module Jekyll
  class Youtube < Liquid::Tag

    def initialize(name, markup, tokens)
        if markup =~ /(\S+) (\d+) (\d+)/i
            @id = $1
            @width = $2
            @height = $3
        else
            @id = markup
            @width = 480
            @height = 360
        end
        super
    end

    def render(context)
      %(<div class="embed-video-container"><iframe width="#{@width}" height="#{@height}" src="http://www.youtube.com/embed/#{@id}" frameborder="0" allowfullscreen></iframe></div>)
    end
  end
end

Liquid::Template.register_tag('youtube', Jekyll::Youtube)
