class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.text :name
      t.text :priority
      t.text :to
      t.text :frontend
      t.text :backend
      t.text :customer

      t.timestamps
    end
  end
end
