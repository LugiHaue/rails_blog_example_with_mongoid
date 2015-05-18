Rails.application.routes.draw do
  
  # Panel

#  controller :panel do 

#  end

  get 'panel/category-new' => 'panel#categoryNew' , as: 'pCategoryNew'

    post 'panel/category-new' => 'panel#categoryNew' , as: 'pCategoryNew_post'

  get 'panel/category-edit' => 'panel#categoryEdit' , as: 'pCategoryEdit'

    post 'panel/category-edit' => 'panel#categoryEdit' , as: 'pCategoryEdit_post'
  
  get 'panel/category-delete' => 'panel#categoryDelete' , as: 'pCategoryDelete'

  get 'panel/category-status' => 'panel#categoryStatus' , as: 'pCategoryStatus'

  get 'panel/categories' => 'panel#categories' , as: 'pCategories'
  
  get 'panel/contact-page' => 'panel#contactPage' , as: 'pContactPage'

    post 'panel/contact-page' => 'panel#contactPage' , as: 'pContactPage_post'
  
  get 'panel/about-page' => 'panel#aboutPage' , as: 'pAboutPage'

    post 'panel/about-page' => 'panel#aboutPage' , as: 'pAboutPage_post'

  get 'panel/contact' => 'panel#contact' , as: 'pContact'

  get 'panel/contact-status' => 'panel#contactStatus' , as: 'pContactStatus'

  get 'panel/contact-review' => 'panel#contactReview' , as: 'pContactReview'

  get 'panel/contact-delete' => 'panel#contactDelete' , as: 'pContactDelete'

  get 'panel/post-edit' => 'panel#postEdit' , as: 'pPostEdit'

    post 'panel/post-edit' => 'panel#postEdit' , as: 'pPostEdit_post'
  
  get 'panel/post-status' => 'panel#postStatus' , as: 'pPostStatus'

  get 'panel/post-delete' => 'panel#postDelete' , as: 'pPostDelete'

  get 'panel/post-new' => 'panel#postNew' , as: 'pPostNew'

    post 'panel/post-new' => 'panel#postNew' , as: 'pPostNew_post'
  
  get 'panel/post' => 'panel#post' , as: 'pPost'

  get 'panel/index' => 'panel#index' , as: 'pIndex'

  get 'panel/login' => 'panel#login'

    post 'panel/login' => 'panel#login'

  get 'panel/logout' => 'panel#logout'

  get 'panel' => 'panel#index'





  # Home

  get 'post'    => 'home#post' , as: 'post'

  get 'contact' => 'home#contact'

    post 'contact' => 'home#contact'

  get 'about'   => 'home#about'

  get 'index'   => 'home#index'

  get 'show'    => 'home#show'
  
  root 'home#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
