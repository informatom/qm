require 'spec_helper'

describe "news/index" do
  before(:each) do
    assign(:news, [
      stub_model(News,
        :name => "Name",
        :description => "MyText",
        :userstamps => "Userstamps"
      ),
      stub_model(News,
        :name => "Name",
        :description => "MyText",
        :userstamps => "Userstamps"
      )
    ])
  end

  it "renders a list of news" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Userstamps".to_s, :count => 2
  end
end
