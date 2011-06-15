class CreateAccounts < ActiveRecord::Migration
  def change
    change_table :accounts do |t|

      t.timestamps
    end
  end
end
