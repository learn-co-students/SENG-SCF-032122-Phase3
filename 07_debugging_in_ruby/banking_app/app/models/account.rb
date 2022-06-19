class Account < ActiveRecord::Base
 belongs_to :bank
 belongs_to :user

#  - `Account#summary`
#   - should return a string formatted as follows:
#     `"{insert account_label} {insert account_type} account balance: {insert account balance}"`

def summary
  "#{label} #{account_type} account balance: #{balance}"
end


end