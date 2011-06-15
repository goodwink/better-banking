class AccountSubtype < ActiveRecord::Base
  has_many    :account_products
  belongs_to  :account_type
  
end
