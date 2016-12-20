# In config/initializers/rack-attack.rb
class Rack::Attack
  # your custom configuration...
  Rack::Attack.blocklist('block 1.2.3.4') do |req|
    # Requests are blocked if the return value is truthy
    '117.196.228.17' == req.ip
  end
end