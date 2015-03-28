class AddStatusToTestSuites < ActiveRecord::Migration
  def change
    add_column :test_suites, :status, :integer
  end
end
