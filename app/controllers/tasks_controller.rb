class TasksController < ApplicationController
  def index
    @bucket = Bucket.find(params[:bucket_id])
    @pending = @bucket.tasks.pending
  end
  def completed
    @bucket = Bucket.find(params[:bucket_id])
    @completed = @bucket.tasks.completed
  end
  def complete
    @task = Task.find(params[:id])
    @task.complete
    redirect_to bucket_tasks_path(@task.bucket)
  end
  def new
    @bucket = Bucket.find(params[:bucket_id])
    @task = @bucket.tasks.build
  end
  def create
    @bucket = Bucket.find(params[:bucket_id])
    @task = Task.new(params[:task])
    @task.bucket = @bucket
    if(@task.save)
      redirect_to bucket_tasks_path(@bucket)
    else
      render :action=>:new
    end
  end
  def show
  end
  def edit
    @task = Task.find(params[:id])
  end
  def update
    @task = Task.find(params[:id])
    if(@task.update_attributes(params[:task]))
      redirect_to bucket_tasks_path(@task.bucket)
    else
      render :action=>:edit
    end
  end
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to bucket_tasks_path(@task.bucket)
  end
end
