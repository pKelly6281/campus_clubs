class AddDetailsToEboards < ActiveRecord::Migration
  def change
    add_reference :eboards, :user, index: true
    add_reference :eboards, :club, index: true
    add_reference :eboards, :executivepostion, index: true
  end
end
