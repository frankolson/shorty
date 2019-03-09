class Current < ActiveSupport::CurrentAttributes
  attribute :referrer, :user_agent
end

