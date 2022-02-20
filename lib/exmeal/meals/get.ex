defmodule Exmeal.Meals.Get do
  alias Exmeal.{Error, Meal, Repo}

  def by_id(id) do
    Repo.get(Meal, id)
    |> handle_get()
  end

  defp handle_get(nil), do: {:error, %Error{result: "Meal not found", status: :not_found}}
  defp handle_get(result), do: {:ok, result}
end
