class CreateGroupExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :group_expenses do |t|
      t.bigint :group_id
      t.bigint :expense_id

      t.timestamps
    end
  end
end
