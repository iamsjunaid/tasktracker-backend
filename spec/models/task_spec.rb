require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it 'is invalid without a title' do
      task = Task.new(title: nil, status: 'open')
      expect(task).to be_invalid
    end
  end
end