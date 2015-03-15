class Issue < ActiveRecord::Base
  belongs_to :feature
  belongs_to :test_suite
  belongs_to :user

  before_save :compile_html

  MARKDOWN_CONFIG = {
    no_intra_emphasis: true,
    autolink: true,
    space_after_headers: true
  }

  RENDER_CONFIG = {
    hard_wrap: true
  }

  def compile_html
    content  = description_markdown || ''
    rndr     = Redcarpet::Render::HTML.new(RENDER_CONFIG)
    markdown = Redcarpet::Markdown.new(rndr, MARKDOWN_CONFIG)
    self.description_html = markdown.render(content)
  end

end
