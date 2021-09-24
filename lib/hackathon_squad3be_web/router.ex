defmodule HackathonSquad3beWeb.Router do
  use HackathonSquad3beWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HackathonSquad3beWeb do
    pipe_through :api
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: HackathonSquad3beWeb.Telemetry
    end
  end
end
