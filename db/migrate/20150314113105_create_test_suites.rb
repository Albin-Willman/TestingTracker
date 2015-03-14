class CreateTestSuites < ActiveRecord::Migration
  def change
    create_table :test_suites do |t|
      t.string :name
      t.text :description
      t.boolean :done

      t.timestamps null: false
    end
  end
end
