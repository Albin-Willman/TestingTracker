class CreateGithubTokens < ActiveRecord::Migration
  def change
    create_table :github_tokens do |t|
      t.string :access_token
      t.string :title

      t.timestamps null: false
    end
  end
end
