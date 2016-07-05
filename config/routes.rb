Rails.application.routes.draw do
  
  # resources :job_alerts
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'static_page#home'
  
  # Without HTML
  get 'index' => 'static_page#home'
  get 'about' => 'static_page#about'
  # get 'help' => 'static_page#help'
  get 'jobs' => 'static_page#jobs'
  get 'setting' => 'static_page#setting'
  # With HTML
  get 'index.html' => 'static_page#home'
  get 'about.html' => 'static_page#about'
  # get 'help.html' => 'static_page#help'
  # get 'jobs.html' => 'static_page#jobs'

  get 'new_job_alert', to:'job_alerts#new'
  post 'job_alerts', to:'job_alerts#create'


end
