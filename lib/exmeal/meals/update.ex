defmodule Exmeal.Meals.Update do
  alias Exmeal.{Error, Meal, Repo}

  def call(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> build_error()
      meal -> do_update(meal, params)
    end
  end

  defp do_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end

  defp build_error, do: {:error, %Error{result: "Meal not found", status: :not_found}}
end
