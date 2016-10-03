require 'rails_helper'

describe "Items CRUD API" do
  it "returns a list of items" do
    create_list(:item, 3)
    get "/api/v1/items"
    items = JSON.parse(response.body)

    expect(response).to be_success #checks response is in the 200 family
    expect(items.count).to eq(3)
  end
end
