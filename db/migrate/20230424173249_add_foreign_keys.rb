class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :groups, :users, column: :user_id, on_delete: :cascade
    add_foreign_key :expenses, :users, column: :author_id, on_delete: :cascade
    add_foreign_key :group_expenses, :groups, column: :group_id, on_delete: :cascade
    add_foreign_key :group_expenses, :expenses, column: :expense_id, on_delete: :cascade
  end
end
