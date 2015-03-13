class CreateTesters < ActiveRecord::Migration
  def change
    create_table :testers do |t|
      t.belongs_to :user, index: true
      t.belongs_to :bug_bash, index: true

      t.timestamps null: false
    end
    add_foreign_key :testers, :users
    add_foreign_key :testers, :bug_bashes
  end
end
