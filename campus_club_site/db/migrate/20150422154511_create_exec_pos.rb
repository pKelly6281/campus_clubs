class CreateExecPos < ActiveRecord::Migration
  def change
    create_table :exec_pos do |t|
      t.string :position

      t.timestamps null: false
    end
  end
end
