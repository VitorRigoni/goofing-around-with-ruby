require_relative 'http_client'
require 'dry/monads'
require 'dry/monads/result'

include Dry::Monads[:try]
include Dry::Monads[:result]

# Getting data from the Star Wars API and printing the name
# Cool thing: I found this dry/monads gem. Still very new and lacking tons
# of stuff, but we have base things like a result type, try, either, validation, and stuff
# probably enough to get this working =)
get('https://swapi.dev/api/people/1')
  .bind { |response| Try { response.parsed_response['name'] } }
  .to_result
  .either(
    -> name { puts name }, #I'm really sad ruby doesn't do method grouping and we have to be this verbose =(
    -> r { puts "Failed to query the data #{r.failure}" }
  )
