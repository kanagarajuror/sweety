Rails.application.routes.draw do
 resources :patients
 
 get "reports/index"
 get "reports/day_wise"
 get "reports/month_to_date"
 get "reports/month_wise"
 get "reports/day_wise_result"
 get "reports/month_to_date_result"
 get "reports/month_wise_result"

 devise_for :users
 root :to => 'patients#index'
   end
