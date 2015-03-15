class CreateTesters < ActiveRecord::Migration
  def change
    create_table :testers do |t|
      t.belongs_to :user, index: true
      t.belongs_to :test_suite, index: true

      t.timestamps null: false
    end
    add_foreign_key :testers, :users
    add_foreign_key :testers, :test_suites
  end
end
