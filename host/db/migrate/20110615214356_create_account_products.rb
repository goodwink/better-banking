class CreateAccountProducts < ActiveRecord::Migration
  def change
    change_table :account_products do |t|

      t.timestamps
    end
  end
end
