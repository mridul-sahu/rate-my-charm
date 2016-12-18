require 'test_helper'

class VotingControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get voting_new_url
    assert_response :success
  end

end
