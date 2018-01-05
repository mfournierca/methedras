defmodule MethedrasWeb.ChecklistView do
  use MethedrasWeb, :view
  alias MethedrasWeb.ChecklistView

  def render("index.json", %{checklists: checklists}) do
    %{data: render_many(checklists, ChecklistView, "checklist.json")}
  end

  def render("show.json", %{checklist: checklist}) do
    %{data: render_one(checklist, ChecklistView, "checklist.json")}
  end

  def render("checklist.json", %{checklist: checklist}) do
    %{id: checklist.id,
      data: checklist.data}
  end
end
