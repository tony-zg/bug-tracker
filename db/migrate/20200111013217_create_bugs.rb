class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.text :name
      t.integer :priority
      t.text :team_member
      t.text :status
      t.date :start_date
      t.date :due_date
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end
end
