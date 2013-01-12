class RenameSittingToAttendee < ActiveRecord::Migration
  def up
    rename_table :sittings, :attendees
  end

  def down
    rename_table :attendees, :sittings
  end
end
