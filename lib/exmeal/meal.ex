defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @fields [:description, :date, :calories]
  @derive {Jason.Encoder, only: @fields ++ [:id]}

  schema "meals" do
    field(:description, :string)
    field(:date, :date)
    field(:calories, :integer)

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:description, min: 6)
    |> validate_number(:calories, greater_than: 0)
  end
end
