class Account
  include Messaging::MessageModel
  
  #include Mongoid::Document
  #field :id, :type => String
  #field :product_id, :type => Int
  #field :institution_id, :type => String
  #field :nickname, :type => String
  #field :description, :type => String
  #field :display_balance_id, :type => String
  
  def initialize
    setup_messaging("account_inquiry", "123456780")
  end
end
