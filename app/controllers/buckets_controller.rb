class BucketsController < ApplicationController
  def index
    @buckets = Bucket.all
  end
  def new
    @bucket = Bucket.new
  end
  def create
    @bucket = Bucket.new(params[:bucket])
    if(@bucket.save)
      redirect_to buckets_path
    else
      render :action=>:new
    end
  end
end
