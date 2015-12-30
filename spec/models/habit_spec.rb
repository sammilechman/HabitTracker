require 'rails_helper'

RSpec.describe Habit, type: :model do
  describe 'validates' do
    before :each do
      @habit = FactoryGirl.build(:habit)
      assert_valid(@habit)
    end

    it 'presence of title' do
      @habit.title = nil
      assert_not_valid(@habit)
    end

    it 'presence of title' do
      @habit.user = nil
      assert_not_valid(@habit)
    end
  end
end
