class Markdowner
  MARKDOWN_CONFIG = {
    no_intra_emphasis: true,
    autolink: true,
    space_after_headers: true
  }

  RENDER_CONFIG = {
    hard_wrap: true
  }

  def self.markdown_to_html(content = '')
    rndr     = Redcarpet::Render::HTML.new(RENDER_CONFIG)
    markdown = Redcarpet::Markdown.new(rndr, MARKDOWN_CONFIG)
    markdown.render(content)
  end
end
