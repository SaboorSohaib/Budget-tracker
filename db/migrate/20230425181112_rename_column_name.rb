class RenameColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :expenses, :author_id, :user_id
  end
end
