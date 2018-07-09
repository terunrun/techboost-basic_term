Rails.application.routes.draw do

  # unit20 sessionsコントローラ新規作成に伴い自動で追加される
  get 'sessions/new'
  # unit20 以下を追加
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # unit17 usersコントローラ新規作成に伴い自動で追加される
  get 'users/new'
  # unit18 resoucesを定義することで、userの各名前付きルートを使用可能になる
  # unit18 railstutorial的には以下
  # GET    /users        index   users_path           すべてのユーザーを一覧するページ
  # GET    /users/1      show    user_path(user)      特定のユーザーを表示するページ
  # GET    /users/new    new     new_user_path        ユーザーを新規作成するページ (ユーザー登録)
  # POST   /users        create  users_path           ユーザーを作成するアクション
  # GET    /users/1/edit edit    edit_user_path(user) id=1のユーザーを編集するページ
  # PATCH	 /users/1      update  user_path(user)      ユーザーを更新するアクション
  # DELETE /users/1      destroy user_path(user)      ユーザーを削除するアクション
  # unit18 techboost的には以下
  # HTTP動詞 / URL / コントローラー#アクション /
  # GET    | users          | users#index |
  # GET    | users/new      | users#new |
  # POST   | users          | users#create |
  # GET    | users/:id      | users#show |
  # GET    | users/:id/edit | users#edit |
  # PATCH  | users/:id      | users#update |
  # DELETE | users/:id      | users#delete |
  resources :users

  # rootメソッドのときとgetメソッドのときで記載方法が違うのはなぜ？★
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # unit16 追加
  root 'pages#index'
  # unit16 getメソッドでpages/helpというURLをpagesコントローラーのhelpアクションに紐づける
  get 'pages/help'
end
