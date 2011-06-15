class CreateAccountTypes < ActiveRecord::Migration
  def change
    change_table :account_types do |t|

      t.timestamps
    end
  end
end
