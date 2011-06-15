class AccountType < ActiveRecord::Base
  has_many    :account_subtypes
end
