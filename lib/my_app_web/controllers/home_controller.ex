defmodule MyAppWeb.HomeController do
  use MyAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
