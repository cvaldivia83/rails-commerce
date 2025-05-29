require "rails_helper"


RSpec.describe User, type: :model do 
  describe "role enums" do
    it "defines the corect roles" do 
      puts User.roles.inspect
      expect(User.roles).to eq(
        'business_owner' => 0,
        'admin' => 1,
        'developer' => 2
      )
    end

    it "returns true for the correct role helper methods" do 
      user = User.new(role: :admin)

      expect(user.admin?).to be true
      expect(user.business_owner?).to be false
      expect(user.developer?).to be false
    end

    it "scopes users by role correctly" do 
      admin = User.create!(email: 'jkjk@direct.com', password: "password", role: :admin)
      dev = User.create!(email: 'devdev@direct.com', password: "password", role: :developer)

      expect(User.admin).to include(admin)
      expect(User.admin).not_to include(dev)

      expect(User.developer).to include(dev)
      expect(User.developer).not_to include(admin)
    end

    it "raises an error when assigned an invalid role" do 
      expect { User.new(role: :president) }.to raise_error(ArgumentError)
    end
  end
end