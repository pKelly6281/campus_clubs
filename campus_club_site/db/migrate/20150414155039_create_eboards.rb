class CreateEboards < ActiveRecord::Migration
  def change
    create_table :eboards do |t|

      t.timestamps null: false
    end
  end
end
