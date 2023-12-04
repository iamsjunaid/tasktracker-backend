require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it 'is invalid without a title' do
      task = Task.new(title: nil, status: 'open')
      expect(task).to be_invalid
    end

    it 'is invalid without a status' do
      task = Task.new(title: 'Task 1', status: nil)
      expect(task).to be_invalid
    end
  end
end
