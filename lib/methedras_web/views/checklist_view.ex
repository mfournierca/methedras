defmodule MethedrasWeb.ChecklistView do
  use MethedrasWeb, :view

  def render("data.json", %{checklist: checklist}) do
    %{checklist: %{data: checklist}}
  end
end
