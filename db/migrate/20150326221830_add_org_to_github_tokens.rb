class AddOrgToGithubTokens < ActiveRecord::Migration
  def change
    add_column :github_tokens, :organization, :string
  end
end
