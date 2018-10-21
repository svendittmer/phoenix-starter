defmodule SeaTradersWeb.ShipControllerTest do
  use SeaTradersWeb.ConnCase

  alias SeaTraders.Ships
  alias SeaTraders.Coherence.User

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  setup %{conn: conn} do
    user = %User{name: "test", email: "test@example.com"}
    {:ok, conn: assign(conn, :current_user, user), user: user}
  end

  def fixture(:ship) do
    {:ok, ship} = Ships.create_ship(@create_attrs)
    ship
  end

  describe "index" do
    test "lists all ships", %{conn: conn} do
      conn = get conn, ship_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Ships"
    end
  end

  describe "new ship" do
    test "renders form", %{conn: conn} do
      conn = get conn, ship_path(conn, :new)
      assert html_response(conn, 200) =~ "New Ship"
    end
  end

  describe "create ship" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, ship_path(conn, :create), ship: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ship_path(conn, :show, id)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, ship_path(conn, :create), ship: @invalid_attrs
      assert html_response(conn, 200) =~ "New Ship"
    end
  end

  describe "edit ship" do
    setup [:create_ship]

    test "renders form for editing chosen ship", %{conn: conn, ship: ship} do
      conn = get conn, ship_path(conn, :edit, ship)
      assert html_response(conn, 200) =~ "Edit Ship"
    end
  end

  describe "update ship" do
    setup [:create_ship]

    test "redirects when data is valid", %{conn: conn, ship: ship} do
      conn = put conn, ship_path(conn, :update, ship), ship: @update_attrs
      assert redirected_to(conn) == ship_path(conn, :show, ship)
    end

    test "renders errors when data is invalid", %{conn: conn, ship: ship} do
      conn = put conn, ship_path(conn, :update, ship), ship: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Ship"
    end
  end

  describe "delete ship" do
    setup [:create_ship]

    test "deletes chosen ship", %{conn: conn, ship: ship} do
      conn = delete conn, ship_path(conn, :delete, ship)
      assert redirected_to(conn) == ship_path(conn, :index)
    end
  end

  defp create_ship(_) do
    ship = fixture(:ship)
    {:ok, ship: ship}
  end
end
