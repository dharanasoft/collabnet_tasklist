Tasklist::Application.routes.draw do

  resources :buckets, :shallow=>true do
    resources :tasks do
      collection do 
        get 'completed'=>'tasks#completed' 
      end
      member do
        post 'complete'=>'tasks#complete'
      end
    end
  end
  root :to=>"buckets#index"
end
