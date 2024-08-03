class RenameAttendedEventToEvent < ActiveRecord::Migration[7.1]
  def change
    rename_column :attendances, :attended_event_id, :event_id
  end
end
