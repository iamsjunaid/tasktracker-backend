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

  describe 'POST /tasks' do
    it 'creates a new task' do
      expect do
        post '/api/v1/tasks', params: { tasks: { title: 'Task 1', description: 'Description 1', status: 'open' } }
      end.to change { Task.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'GET /tasks/:id' do
    it 'returns a task' do
      task = Task.create(title: 'Task 1', description: 'Description 1', status: 'open')

      get "/api/v1/tasks/#{task.id}"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to eq(task.id)
    end
  end
end
