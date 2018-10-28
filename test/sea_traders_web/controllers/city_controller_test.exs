defmodule SeaTradersWeb.CityControllerTest do
  use SeaTradersWeb.ConnCase

  alias SeaTraders.Cities

  @create_attrs %{latitude: 120.5, longitude: 120.5, name: "some name"}
  @update_attrs %{latitude: 456.7, longitude: 456.7, name: "some updated name"}
  @invalid_attrs %{latitude: nil, longitude: nil, name: nil}

  setup %{conn: conn} do
    user = %SeaTraders.Coherence.User{name: "test", email: "test@example.com"}
    {:ok, conn: assign(conn, :current_user, user), user: user}
  end

  def fixture(:city) do
    {:ok, city} = Cities.create_city(@create_attrs)
    city
  end

  describe "index" do
    test "lists all cities", %{conn: conn} do
      conn = get conn, city_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Cities"
    end
  end

  describe "new city" do
    test "renders form", %{conn: conn} do
      conn = get conn, city_path(conn, :new)
      assert html_response(conn, 200) =~ "New City"
    end
  end

  describe "create city" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, city_path(conn, :create), city: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == city_path(conn, :show, id)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, city_path(conn, :create), city: @invalid_attrs
      assert html_response(conn, 200) =~ "New City"
    end
  end

  describe "edit city" do
    setup [:create_city]

    test "renders form for editing chosen city", %{conn: conn, city: city} do
      conn = get conn, city_path(conn, :edit, city)
      assert html_response(conn, 200) =~ "Edit City"
    end
  end

  describe "update city" do
    setup [:create_city]

    test "redirects when data is valid", %{conn: conn, city: city} do
      conn = put conn, city_path(conn, :update, city), city: @update_attrs
      assert redirected_to(conn) == city_path(conn, :show, city)
    end

    test "renders errors when data is invalid", %{conn: conn, city: city} do
      conn = put conn, city_path(conn, :update, city), city: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit City"
    end
  end

  describe "delete city" do
    setup [:create_city]

    test "deletes chosen city", %{conn: conn, city: city} do
      conn = delete conn, city_path(conn, :delete, city)
      assert redirected_to(conn) == city_path(conn, :index)
    end
  end

  defp create_city(_) do
    city = fixture(:city)
    {:ok, city: city}
  end
end
