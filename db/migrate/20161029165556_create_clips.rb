class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.integer :mix_id
      t.integer :order, null: false
      t.integer :start_time, null: false
      t.integer :duration, null: false

      t.timestamps null: false
    end
  end
end
