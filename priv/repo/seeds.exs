# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SeaTraders.Repo.insert!(%SeaTraders.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
SeaTraders.Coherence.User |> SeaTraders.Repo.delete_all

%SeaTraders.Coherence.User{}
|> SeaTraders.Coherence.User.changeset(%{
  name: "Test User",
  email: "testuser@example.com",
  password: "secret",
  password_confirmation: "secret"
})
|> SeaTraders.Repo.insert!
|> Coherence.Controller.confirm!
