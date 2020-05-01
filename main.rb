require_relative 'http_client'
require 'dry/monads'
require 'dry/monads/result'

include Dry::Monads[:try]
include Dry::Monads[:result]

get('https://swapi.dev/api/people/1')
  .bind { |response| Try { response.parsed_response } }
  .to_result
  .either(
    -> r { puts r['name'] },
    -> r { puts "Failed to query the data #{r.failure}" }
  )
