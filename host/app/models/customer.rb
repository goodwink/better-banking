class Customer < ActiveRecord::Base
  has_many    :accounts
  
  def as_json(options={})
    options[:include] ||= :accounts
    super(options)
  end
end
