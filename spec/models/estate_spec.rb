require 'rails_helper'

RSpec.describe Estate, type: :model do
  describe "validations" do
    it "validate presence" do
      should validate_presence_of(:name)
      should validate_presence_of(:type)
      should validate_presence_of(:street)
      should validate_presence_of(:external_number)
      should validate_presence_of(:Internal_number)
      should validate_presence_of(:neighborhood)
      should validate_presence_of(:city)
      should validate_presence_of(:country)
      should validate_presence_of(:rooms)
      should validate_presence_of(:bathrooms)
      should validate_presence_of(:comments)
    end
    it "validate name" do
      should validate_length_of(:name).is_at_least(1).is_at_most(128)
    end
    it "validate type" do
      should validate_inclusion_of(:type).in_array(%w[house department land commercial_ground].map(&:to_sym))
    end
    it "validate street" do
      should validate_length_of(:street).is_at_least(1).is_at_most(128)
    end
    it "validate external_number" do
      should allow_value('dsad-26').for(:external_number)
      should validate_length_of(:external_number).is_at_least(1).is_at_most(12)
    end
    # it "validate Internal_number" do
    #   should validate_presence_of(:Internal_number)
    # end
    it "validate neighborhood" do
      should validate_length_of(:neighborhood).is_at_least(1).is_at_most(128)
    end
    it "validate city" do
      should validate_length_of(:city).is_at_least(1).is_at_most(64)
    end
    it "validate country" do
        should validate_inclusion_of(:country).in_array(ISO3166::Country.all.map(&:alpha2))
    end
    # it "validate country" do
    #   should validate_presence_of(:country)
    # end
    # it "validate rooms" do
    #   should validate_presence_of(:rooms)
    # end
    it "validate bathrooms" do
      if should validate_inclusion_of(:type).in_array(%w[land commercial_ground].map(&:to_sym))
        should validate_presence_of(:bathrooms)
      end
    end
    it "validate comments" do
      should validate_length_of(:comments).is_at_least(1).is_at_most(128)
    end
  end
end
