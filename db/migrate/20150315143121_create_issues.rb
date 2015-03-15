class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.belongs_to :feature, index: true
      t.belongs_to :test_suite, index: true
      t.string :title
      t.boolean :closed
      t.integer :number
      t.text :description_markdown
      t.text :description_html
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :issues, :features
    add_foreign_key :issues, :test_suites
    add_foreign_key :issues, :users
  end
end
