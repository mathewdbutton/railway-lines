class CreateTimelines < ActiveRecord::Migration[5.1]
  def change
    create_table :timelines do |t|
      t.string :name
      t.timestamps
    end
  end
end
