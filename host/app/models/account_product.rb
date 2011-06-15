class AccountProduct < ActiveRecord::Base
  has_many    :accounts
  belongs_to  :account_subtype
  
end
