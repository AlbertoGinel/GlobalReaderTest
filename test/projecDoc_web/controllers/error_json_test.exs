defmodule ProjecDocWeb.ErrorJSONTest do
  use ProjecDocWeb.ConnCase, async: true

  test "renders 404" do
    assert ProjecDocWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert ProjecDocWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
