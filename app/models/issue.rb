class Issue < ActiveRecord::Base
  belongs_to :feature
  belongs_to :test_suite
  belongs_to :user

  has_one :github_token, through: :test_suite

  validates_presence_of :title, :user

  before_save :compile_html
  before_create :register_on_github

  def compile_html
    self.description_html = Markdowner.markdown_to_html(description_markdown)
  end

  def register_on_github
    return unless github_token
    client = github_token.client
    begin
      issue = client.create_issue(test_suite.repo, title, build_github_markdown)
      self.closed = false
      self.number = issue[:number]
    rescue
    end
  end

  def build_github_markdown
    components = [
      'Issue created in test tracker:',
      description_markdown,
      "By user: #{user.email}"
    ]
    components << "Test suite: #{test_suite.name}" if test_suite
    components << "feature: #{feature.name}" if feature
    components.join('<br/><br/>')
  end

end
