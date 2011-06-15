class CreateAccountSubtypes < ActiveRecord::Migration
  def change
    change_table :account_subtypes do |t|

      t.timestamps
    end
  end
end
