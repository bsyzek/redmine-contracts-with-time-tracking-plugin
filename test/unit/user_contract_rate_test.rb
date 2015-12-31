require File.expand_path('../../test_helper', __FILE__)

class UserContractRateTest < ActiveSupport::TestCase
  self.fixture_path = File.expand_path('../../fixtures', __FILE__)
  fixtures :projects, :contracts, :time_entries, :user_contract_rates

  def setup
    @project = projects(:projects_001)
    @contract = contracts(:contract_one)
    @user = @project.users.first
    @user_contract_rate = UserContractRate.create!(:contract => @contract, :user => @user)
  end

  test "should belong to a user" do
    assert_respond_to @user_contract_rate, :user
    assert_equal @user, @user_contract_rate.user
  end

  test "should belong to a contract" do
    assert_respond_to @user_contract_rate, :contract
    assert_equal @contract, @user_contract_rate.contract
  end
end
