class CreateTransactions < ActiveRecord::Migration
  def change
    change_table :transactions do |t|

      t.timestamps
    end
  end
end
