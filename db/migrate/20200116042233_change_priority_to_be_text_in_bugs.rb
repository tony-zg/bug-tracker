class ChangePriorityToBeTextInBugs < ActiveRecord::Migration[5.2]
  def change
    change_column :bugs, :priority, :text
  end
end
