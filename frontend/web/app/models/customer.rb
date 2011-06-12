class Customer
  include Mongoid::Document
  include Messaging::HybridModel
  
  field :cif, :type => String
  field :name, :type => String
  field :business?, :type => Boolean
  field :address1, :type => String
  field :address2, :type => String
  field :city, :type => String
  field :state, :type => String
  field :zip, :type => String

end
