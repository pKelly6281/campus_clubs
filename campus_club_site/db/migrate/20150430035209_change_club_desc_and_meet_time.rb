class ChangeClubDescAndMeetTime < ActiveRecord::Migration
  def change
  	change_column :clubs, :desc, :text
  	change_column :clubs, :meetTime, :text
  end
end
