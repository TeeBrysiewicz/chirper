defmodule ChirperWeb.Router do
  use ChirperWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChirperWeb do
    pipe_through [:browser, ChirperWeb.Plugs.Guest]

    resources "/register", UserController, only: [:create, :new, :index, :show]
    get "/login", SessionController, :new
    post "/login", SessionController, :create
  end

  scope "/", ChirperWeb do
    pipe_through [:browser, ChirperWeb.Plugs.Auth]

    delete "/logout", SessionController, :delete

    get "/", PostController, :index
    get "/show", PageController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChirperWeb do
  #   pipe_through :api
  # end
end
