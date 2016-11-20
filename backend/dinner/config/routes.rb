Rails.application.routes.draw do
  get 'control/create_account'

  get 'control/get_daily'

  get 'control/set_prefs'

  get 'control/people_interested'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
