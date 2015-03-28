class UserSession < Authlogic::Session::Base
  extend ActiveModel::Naming # Needed to work with Rails 4.2 https://github.com/binarylogic/authlogic/issues/432
  
  def persisted?
    false
  end
end
