require 'spec_helper'
require 'json'
require 'webmock'
require '../http_client'

RSpec.describe StarWarsApi do
  subject() { described_class.new }
  it "expects calls to get person by id to call swapi" do

    stub_request(:get, 'https://swapi.dev/api/people/1')
      .to_return(body: {:name => "Luke Skywalker"}.to_json)

    cli = StarWarsApi.new
    result = JSON.parse(cli.get_person(1))
    expect(result['name']).to eql 'Luke Skywalker'
  end
end