class CreateBugBashes < ActiveRecord::Migration
  def change
    create_table :bug_bashes do |t|
      t.string :name
      t.boolean :done

      t.timestamps null: false
    end
  end
end
