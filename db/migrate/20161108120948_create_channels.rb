class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string   :name, limit: 64, null: false
      t.string   :callsign, limit: 64, null: false
      t.timestamps null: false
    end
  end
end
