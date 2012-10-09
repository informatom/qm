require 'spec_helper'

describe "news/new" do
  before(:each) do
    assign(:news, stub_model(News,
      :name => "MyString",
      :description => "MyText",
      :userstamps => "MyString"
    ).as_new_record)
  end

  it "renders new news form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => news_index_path, :method => "post" do
      assert_select "input#news_name", :name => "news[name]"
      assert_select "textarea#news_description", :name => "news[description]"
      assert_select "input#news_userstamps", :name => "news[userstamps]"
    end
  end
end
