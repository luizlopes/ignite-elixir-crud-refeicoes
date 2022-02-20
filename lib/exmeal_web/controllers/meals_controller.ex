defmodule ExmealWeb.MealsController do
  use ExmealWeb, :controller

  alias Exmeal.Meal
  alias Exmeal.Meals.{Create, Delete, Get, Update}

  action_fallback(ExmealWeb.FallbackController)

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- Get.by_id(id) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end

  def update(conn, params) do
    with {:ok, meal} <- Update.call(params) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, _meal} <- Delete.call(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
