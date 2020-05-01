require 'httparty'
require 'dry-monads'
require 'json'

include Dry::Monads[:try]

def get (url)
  Try { HTTParty.get(url) }.to_result
end
