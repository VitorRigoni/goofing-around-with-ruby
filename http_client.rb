require 'httparty'
require 'dry-monads'
require 'json'

include Dry::Monads[:task, :try]

class StarWarsApi
    include HTTParty
    base_uri 'https://swapi.dev/api'

    def get_person(person_id)
        self.class.get("/people/#{person_id}")
    end
end

def get (url)
    Try { HTTParty.get(url) }
end
