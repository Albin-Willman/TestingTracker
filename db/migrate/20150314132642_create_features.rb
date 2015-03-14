class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.text :description_markdown
      t.text :description_html
      t.belongs_to :test_suite, index: true

      t.timestamps null: false
    end
    add_foreign_key :features, :test_suites
  end
end
