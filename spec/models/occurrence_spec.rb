require 'rails_helper'

RSpec.describe Occurrence, type: :model do
  before :each do
    @time = Time.current
    @occurrence = FactoryGirl.create(:occurrence, created_at: @time)
  end

  describe 'factory' do
    it 'is valid' do
      assert_valid(@occurrence)
    end
  end

  describe 'instance method' do
    it '#readable_created_at' do
      readable_time = @time.in_time_zone(TimeModule::TIME_ZONE).strftime("%I:%M%P, %A, %B %d %Y")
      assert_equal(readable_time, @occurrence.readable_created_at)
    end
  end

  describe 'default scope' do
    it 'should keep the newest occurrence .first' do
      @occurrence.habit.occurrences.create!
      new_occurrence = @occurrence.habit.occurrences.create!
      assert_equal(new_occurrence, @occurrence.habit.occurrences.first)
    end
  end
end
