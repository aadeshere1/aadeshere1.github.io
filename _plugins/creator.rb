require 'dotenv/load'
require 'trello'
require 'pry'
module Jekyll
  class ContentCreatorGenerator < Generator
    safe true
    ACCEPTED_COLOR = "green"

    def setup
      @trello_api_key = ENV['TRELLO_API_KEY']
      @trello_token = ENV['TRELLO_TOKEN']

      Trello.configure do |config|
        config.developer_public_key = @trello_api_key
        config.member_token = @trello_token
      end
    end

    def generate(site)
      setup
      binding.pry
      puts "hello world"
    end
  end
end