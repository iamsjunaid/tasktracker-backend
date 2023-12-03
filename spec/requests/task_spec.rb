require 'rails_helper'

describe 'Tasks API', type: :request do
  describe 'GET /tasks' do
    it 'returns all tasks' do
      Task.create(title: 'Task 1', description: 'Description 1', status: 'open')
      Task.create(title: 'Task 2', description: 'Description 2', status: 'open')

      get '/api/v1/tasks'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end
end
