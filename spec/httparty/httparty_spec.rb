# frozen_string_literal: true

require 'httparty'

describe 'HTTParty' do
  it 'HTTParty' do
    stub_request(:get, 'https://jsonplaceholder.typicode.com/posts/1')
      # .with(
      #   headers: {
      #     'Accept' => '*/*',
      #     'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #     'User-Agent' => 'Ruby'
      #   }
      # )
      .to_return(status: 200, body: '', headers: { 'content-type': 'application/json' })

    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/1')
    content_type = response.headers['content-type']
    expect(content_type).to match(%r{application/json})
  end
end
