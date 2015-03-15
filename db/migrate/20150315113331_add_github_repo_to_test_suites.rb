class AddGithubRepoToTestSuites < ActiveRecord::Migration
  def change
    add_column :test_suites, :repo, :string
    add_reference :test_suites, :github_token, index: true
    add_foreign_key :test_suites, :github_tokens
  end
end
