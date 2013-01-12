class CreateSittings < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :person
      t.string :project
      t.boolean :collaborate
      t.boolean :coach

      t.timestamps
    end
  end
end
