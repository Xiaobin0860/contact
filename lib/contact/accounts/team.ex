defmodule Contact.Accounts.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias Contact.Accounts.{User, Team}
  alias Contact.Repo

  @derive {Poison.Encoder, only: [:name, :owner]}
  schema "teams" do
    field :name, :string
    belongs_to :owner, User, on_replace: :update
    many_to_many :members, User, join_through: Member, on_delete: :delete_all, on_replace: :delete

    timestamps()
  end

  def changeset(%Team{} = team, attrs) do
    team
      |> cast(attrs, [:name])
      |> put_assoc(:owner, Repo.get(User, attrs["owner_id"]))
      |> validate_required([:name, :owner])
  end
end
