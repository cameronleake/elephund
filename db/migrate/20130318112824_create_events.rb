class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :event_date
      t.text :description
      t.decimal :cost
      t.string :status

      t.timestamps
    end
  end
end
