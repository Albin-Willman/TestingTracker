class Feature < ActiveRecord::Base
  validates_presence_of :name, :test_suite
  belongs_to :test_suite

  has_many :approvals, dependent: :destroy
  has_many :testers, through: :approvals
  has_many :users,   through: :testers
  has_many :issues

  before_save :compile_html

  def compile_html
    return unless description_markdown
    self.description_html = Markdowner.markdown_to_html(description_markdown)
  end
end
