class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.belongs_to :tester, index: true
      t.belongs_to :feature, index: true

      t.timestamps null: false
    end
    add_foreign_key :approvals, :testers
    add_foreign_key :approvals, :features
  end
end
