require 'spec_helper'

describe "SequenceFlows" do
  describe "GET /sequence_flows" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sequence_flows_path
      response.status.should be(200)
    end
  end
end
