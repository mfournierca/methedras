defmodule MethedrasWeb.ExecutionView do
  use MethedrasWeb, :view
  alias MethedrasWeb.ExecutionView

  def render("index.json", %{executions: executions}) do
    %{data: render_many(executions, ExecutionView, "execution.json")}
  end

  def render("show.json", %{execution: execution}) do
    %{data: render_one(execution, ExecutionView, "execution.json")}
  end

  def render("execution.json", %{execution: execution}) do
    %{id: execution.id,
      checklist_id: execution.checklist_id,
      data: execution.data}
  end
end
