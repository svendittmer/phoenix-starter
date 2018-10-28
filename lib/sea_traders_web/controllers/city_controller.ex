defmodule SeaTradersWeb.CityController do
  use SeaTradersWeb, :controller

  alias SeaTraders.Cities
  alias SeaTraders.Cities.City

  def index(conn, _params) do
    cities = Cities.list_cities()
    render(conn, "index.html", cities: cities)
  end

  def new(conn, _params) do
    changeset = Cities.change_city(%City{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"city" => city_params}) do
    case Cities.create_city(city_params) do
      {:ok, city} ->
        conn
        |> put_flash(:info, "City created successfully.")
        |> redirect(to: city_path(conn, :show, city))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    city = Cities.get_city!(id)
    render(conn, "show.html", city: city)
  end

  def edit(conn, %{"id" => id}) do
    city = Cities.get_city!(id)
    changeset = Cities.change_city(city)
    render(conn, "edit.html", city: city, changeset: changeset)
  end

  def update(conn, %{"id" => id, "city" => city_params}) do
    city = Cities.get_city!(id)

    case Cities.update_city(city, city_params) do
      {:ok, city} ->
        conn
        |> put_flash(:info, "City updated successfully.")
        |> redirect(to: city_path(conn, :show, city))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", city: city, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    city = Cities.get_city!(id)
    {:ok, _city} = Cities.delete_city(city)

    conn
    |> put_flash(:info, "City deleted successfully.")
    |> redirect(to: city_path(conn, :index))
  end
end
