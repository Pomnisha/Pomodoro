class CreatePomodoras < ActiveRecord::Migration
  def change
    create_table :pomodoras do |t|
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
