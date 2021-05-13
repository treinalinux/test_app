# frozen_string_literal: true

require 'httparty'

describe 'HTTParty' do
  # read more https://relishapp.com/vcr/vcr/v/5-0-0/docs
  it 'content-type', vcr: { cassette_name: 'jsonplaceholder.typicode.com/posts', record: :new_episodes } do
    # it 'content-type', vcr: { match_requests_on: [:body] } do
    # stub_request(:get, 'https://jsonplaceholder.typicode.com/posts/1')
    # .with(
    #   headers: {
    #     'Accept' => '*/*',
    #     'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #     'User-Agent' => 'Ruby'
    #   }
    # )
    # .to_return(status: 200, body: '', headers: { 'content-type': 'application/json' })

    # VCR.use_cassette('jsponplaceholder/posts') do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/7')
    # response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/#{[1, 2, 3, 4, 5].sample}")
    # response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/1')
    content_type = response.headers['content-type']
    expect(content_type).to match(%r{application/json})
    # end
  end
end
