require "rails_helper"

RSpec.describe User, type: :model do

  it "has a valid user" do
    expect(build(:user)).to be_valid
  end

  describe "associations" do

    it "has many bookings" do
      is_expected.to have_many(:bookings).dependent :destroy
    end

    it "has many likes" do
      is_expected.to have_many(:likes).dependent :destroy
    end

    it "has many reviews" do
      is_expected.to have_many(:reviews).dependent :destroy
    end

    it "has many comments" do
      is_expected.to have_many(:comments).dependent :destroy
    end

    context "presence" do
      it { should validate_presence_of :name }
    end
  end

  describe "roles" do
    it "are user or admin" do
      is_expected.to define_enum_for(:role).with_values %i(user admin)
    end
  end

  describe "validate" do
    let(:user){FactoryBot.create :user}

    describe "name" do
      it { is_expected.to validate_presence_of(:name) }
      it "can't be blank" do
        user.name = nil
        user.valid?
        expect(user.errors.messages[:name].first).to eq(
          I18n.t "activerecord.errors.models.user.attributes.name.blank")
      end
    end

    describe "phonenumber" do
      it { should allow_value("", nil).for(:phonenumber) }
      it { should validate_numericality_of(:phonenumber) }

      it "when phonenumber is too short" do
        user.phonenumber = Faker::Number.number 8
        user.valid?
        expect(user.errors.messages[:phonenumber].first).to eq(
          I18n.t "activerecord.errors.models.user.attributes.phonenumber.too_short",
          count: Settings.user.min_phone)
      end

      it "when phonenumber is too long" do
        user.phonenumber = Faker::Number.number 12
        user.valid?
        expect(user.errors.messages[:phonenumber].first).to eq(
          I18n.t "activerecord.errors.models.user.attributes.phonenumber.too_long",
          count: Settings.user.max_phone)
      end
    end
  end
end
