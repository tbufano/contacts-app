class CreateGroupedContacts < ActiveRecord::Migration
  def change
    create_table :grouped_contacts do |t|
      t.integer :group_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
