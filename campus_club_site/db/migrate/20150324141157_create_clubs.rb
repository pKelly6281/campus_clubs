class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :desc
      t.string :meetTime
      t.string :meetLoc

      t.timestamps null: false
    end
  end
end
