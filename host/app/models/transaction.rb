class Transaction < ActiveRecord::Base
  belongs_to  :account
  has_one     :offset, class_name: "Transaction", foreign_key: "offset_id"
end
