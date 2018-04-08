class CreateTimelines < ActiveRecord::Migration[5.1]
  def change
    create_table :timeline do |t|
      t.string :name
      t.timestamps
    end
  end
end
