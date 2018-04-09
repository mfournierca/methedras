defmodule Methedras.Guardian do
  use Guardian, otp_app: :methedras

  def subject_for_token(resource, _claims) do
    subject = to_string(resource.id)
    {:ok, subject}
  end

  def subject_for_token(_, _) do
    {:error, :error}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = MethedrasWeb.get_resource_by_id(id)
    {:ok, resource}
  end

  def resource_from_claims(_claims) do
      {:error, :error}
  end
end