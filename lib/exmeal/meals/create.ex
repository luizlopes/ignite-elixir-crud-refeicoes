defmodule Exmeal.Meals.Create do
  alias Exmeal.{Error, Meal, Repo}

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, _} = result), do: result

  defp handle_insert({:error, %Ecto.Changeset{} = changeset}) do
    {:error, %Error{result: changeset, status: :bad_request}}
  end
end
