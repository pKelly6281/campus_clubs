class CreateEboards < ActiveRecord::Migration
  def change
    create_table :eboards do |t|
      t.string :president
      t.string :vice_president
      t.string :secretary
      t.string :treasurer

      t.timestamps null: false
    end
  end
end
