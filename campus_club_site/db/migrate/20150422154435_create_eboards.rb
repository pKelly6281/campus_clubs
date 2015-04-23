class CreateEboards < ActiveRecord::Migration
  def change
    create_table :eboards do |t|
      t.integer :user_id
      t.integer :club_id
      t.integer :exec_po_id

      t.timestamps null: false
    end
  end
end
