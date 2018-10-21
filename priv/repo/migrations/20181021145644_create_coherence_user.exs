defmodule SeaTraders.Repo.Migrations.CreateCoherenceUser do
  use Ecto.Migration
  def change do
    create table(:users) do

      add :name, :string, null: false
      add :email, :string, null: false
      # authenticatable
      add :password_hash, :string, null: false
      # recoverable
      add :reset_password_token, :string
      add :reset_password_sent_at, :utc_datetime
      # lockable
      add :failed_attempts, :integer, default: 0, null: false
      add :locked_at, :utc_datetime
      # unlockable_with_token
      add :unlock_token, :string
      # confirmable
      add :confirmation_token, :string
      add :confirmed_at, :utc_datetime
      add :confirmation_sent_at, :utc_datetime

      timestamps()
    end
    create unique_index(:users, [:email])

  end
end
