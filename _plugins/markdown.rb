# This file is licensed under the MIT License (MIT) available on
# http://opensource.org/licenses/MIT.

module Jekyll
  class MarkdownBlock < Liquid::Block
    def initialize(tag_name, text, tokens)
      super
    end
    require "kramdown"
    def render(context)
      content = super
      doc = Kramdown::Document.new(content)
      res = doc.to_html
      if doc.warnings.count > 0
        puts doc.warnings.join("\n")
        exit
      end
      "#{res}"
    end
  end
end
Liquid::Template.register_tag('markdown', Jekyll::MarkdownBlock)
