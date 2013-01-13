class ReplaceAttendeeBooleanFieldsWithTextFields < ActiveRecord::Migration
  def up
    change_table :attendees do |t|
      t.remove :collaborate, :coach
      t.string :use_help
      t.string :could_help
    end
  end

  def down
    change_table :attendees do |t|
      t.remove :use_help, :could_help
      t.boolean :collaborate
      t.boolean :coach
    end
  end
end
