class CreateHacks < ActiveRecord::Migration
  def change
    create_table :hacks do |t|
      t.string :text
    end
  end
end
