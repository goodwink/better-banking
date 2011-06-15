class Account < ActiveRecord::Base
  belongs_to  :customer
  belongs_to  :account_product
  has_many    :transactions
  
end
