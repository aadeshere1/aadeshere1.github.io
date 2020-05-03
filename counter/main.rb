require 'aws-sdk-dynamodb'
require 'json'

def lambda_handler(event:, context:)
  table = create_connection
  data = get_item(event: event, table: table)

  if !data.nil?
    # dynamodb returns Number as BigDecimal
    # we need to convert BigDecimal to integer
    visit_count = data["visit"].to_i
    increased_count = visit_count + 1

    updated_item = table.update_item({
      key: {
        "url" => event["headers"]["referer"]
      },
      attribute_updates: {
        "visit" => {
          value: increased_count,
          action: "PUT"
        }
      }
    })
    puts "updated item: #{updated_item}"
  else
    new_item = table.put_item({
                  item: {
                    "url" => event["headers"]["referer"],
                    "visit" => 1
                  }
                })
    puts "new item: #{new_item}"
  end

  data = get_item(event: event, table: table)
  total_visit = data["visit"].to_i

  { statusCode: 200,
    body: JSON.generate("total_visit": total_visit),
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": true
    }
  }
end

def get_item(event:, table:)
  table.get_item({
    key:{
      "url" => event["headers"]["referer"]
    }
  }).item
end

def create_connection
  client = Aws::DynamoDB::Client.new(
    region: "us-east-1"
  )

  Aws::DynamoDB::Table.new(name: "visits", client: client)
end
