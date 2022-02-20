defmodule ExmealWeb.MealsController do
  use ExmealWeb, :controller

  alias Exmeal.Meal
  alias Exmeal.Meals.Create

  action_fallback(ExmealWeb.FallbackController)

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end
end
