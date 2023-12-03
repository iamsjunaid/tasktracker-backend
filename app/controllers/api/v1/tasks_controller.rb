module Api
  module V1
    class TasksController < ApplicationController
      before_action :find_task, only: [:show, :update]
      
      def index
        @tasks = Task.all
        render json: @tasks
      end

      def create
        @task = Task.new(task_params)

        if @task.save
          render json: Task.all, status: :created
        else
          render json: @task.errors, status: :unprocessable_entity
        end  
      end

      def show
        render json: @task
      end

      def update
        if @task.update(task_params)
          render json: @task
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      def destroy
        find_task
        @task.destroy
        render json: { message: 'Task successfully destroyed' }, status: :ok
      end

      private

      def task_params
        params.require(:tasks).permit(:title, :description, :status)
      end

      def find_task
        @task = Task.find(params[:id])
      end
    end
  end
end
