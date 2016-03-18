require 'rails_helper'

RSpec.describe Habit, type: :model do
  before :each do
    @habit = FactoryGirl.create(:habit)
  end

  describe 'factory' do
    it 'should be valid' do
      assert_valid(@habit)
    end
  end

  describe 'validates' do
    describe 'presence of' do
      it 'title' do
        @habit.title = nil
        assert_not_valid(@habit)
      end

      it 'user' do
        @habit.user = nil
        assert_not_valid(@habit)
      end
    end
  end

  describe 'occurrences' do
    it 'are destroyed when the habit is destroyed' do
      @habit.create_occurrence!
      @habit.destroy
      assert_equal(0, Occurrence.count)
    end
  end

  describe 'instance method' do
    describe '#create_occurrence!' do
      it 'creates a new occurrence' do
        @habit.create_occurrence!
        assert_equal(@habit.occurrences.count, 1)
      end

      it 'returns a boolean value' do
        assert_true(@habit.create_occurrence!)
      end
    end

    describe '#delete_most_recent_occurrence!' do
      before :each do
        @habit.create_occurrence!
      end

      it 'removes most recent occurrence' do
        @habit.delete_most_recent_occurrence!
        assert_equal(@habit.occurrences.count, 0)
      end

      it 'returns true if successfully deleted' do
        assert_true(@habit.delete_most_recent_occurrence!)
      end

      it 'returns nil if there\'s nothing to delete' do
        @habit.delete_most_recent_occurrence!
        assert_equal(nil, @habit.delete_most_recent_occurrence!)
      end
    end
  end
end
