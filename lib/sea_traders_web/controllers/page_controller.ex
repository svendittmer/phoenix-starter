defmodule SeaTradersWeb.PageController do
  use SeaTradersWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
