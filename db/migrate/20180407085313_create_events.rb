class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :caption
      t.datetime :event_date
      t.belongs_to :timeline, index: true
      t.timestamps
    end
  end
end
