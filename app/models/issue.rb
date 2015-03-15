class Issue < ActiveRecord::Base
  belongs_to :feature
  belongs_to :test_suite
  belongs_to :user

  has_one :github_token, through: :test_suite

  validates_presence_of :title, :user

  before_save :compile_html
  before_create :register_on_github

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

  def register_on_github
    return unless github_token
    client = github_token.github_client
    begin
      issue = client.create_issue(test_suite.repo, title, description_markdown)
      self.closed = false
      self.number = issue[:number]
    rescue
    end
  end

end
