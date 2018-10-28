defmodule SeaTradersWeb.PageControllerTest do
  use SeaTradersWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Sea Traders!"
  end
end
