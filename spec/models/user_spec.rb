require 'rails_helper'

RSpec.describe User, type: :model do

  describe "feature relationships" do

    before(:each) do
      @user = User.create(email: 'email@example.com', password: '123456')
      @test_suite = TestSuite.create(name: 'test')
      @feature = Feature.new(name: 'name', description_markdown: 'markdown')
      @feature.test_suite = @test_suite
      @feature.save!
    end

    it "cannot approve features unless defined as tester" do
      expect(@user.can_approve?(@feature)).to be_falsey
    end

    it "can approve features if defined as tester" do
      @test_suite.users << @user
      @test_suite.reload
      expect(@user.can_approve?(@feature)).to be_truthy
    end

    it "has no last_approved timestamp if feature never been approved" do
      expect(@user.last_approved(@feature)).to eq(false)
    end


    it "has a last_approved timestamp if feature has been approved" do
      @test_suite.users << @user
      @test_suite.reload
      tester = @test_suite.testers.find_by(user_id: @user.id)
      approval = Approval.create!(tester: tester, feature: @feature)
      @feature.reload
      expect(@user.last_approved(@feature)).to be_truthy
    end

  end
end
