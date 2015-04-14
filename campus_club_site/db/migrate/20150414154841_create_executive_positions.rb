class CreateExecutivePositions < ActiveRecord::Migration
  def change
    create_table :executive_positions do |t|
    	t.string :position 
    end
  end
end
