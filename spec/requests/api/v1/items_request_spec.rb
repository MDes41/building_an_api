require 'rails_helper'

describe "Items CRUD API" do
  it "returns a list of items" do
    create_list(:item, 3)
    get "/api/v1/items"
    items = JSON.parse(response.body)
    byebug
    expect(response).to be_success #checks response is in the 200 family
    expect(items.count).to eq(3)
  end

  it "returns the an item in the show page" do
    item = create(:item, name: "Captain Hat")
    get "/api/v1/items/#{item.id}"

    json_item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(json_item['name']).to eq("Captain Hat")
  end

  it "creates a new item" do
    parameters = {name: "Sal's fault", description: "Why'd you take the markers, Sal?"}

    expect {
      post "/api/v1/items/", parameters
    }.to change { Item.count }.by(1)

    item = JSON.parse(response.body)

    expect(item["name"]).to eq(parameters[:name])
    expect(item["description"]).to eq(parameters[:description])
  end
end
