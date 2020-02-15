# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MyApp.Repo.insert!(%MyApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
MyApp.Coherence.User |> MyApp.Repo.delete_all

%MyApp.Coherence.User{}
|> MyApp.Coherence.User.changeset(%{
  name: "Test User",
  email: "testuser@example.com",
  password: "secret",
  password_confirmation: "secret"
})
|> MyApp.Repo.insert!
|> Coherence.Controller.confirm!
