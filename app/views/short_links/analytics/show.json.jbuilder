json.array! @short_link.visits do |visit|
  json.time       visit.created_at
  json.referrer   visit.referrer || 'none'
  json.user_agent visit.user_agent
end

