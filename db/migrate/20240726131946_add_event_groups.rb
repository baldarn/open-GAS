class AddEventGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :event_groups do |t|
      t.belongs_to :event
      t.belongs_to :group

      t.timestamps
    end
  end
end
