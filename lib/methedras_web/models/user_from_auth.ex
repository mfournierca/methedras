defmodule UserFromAuth do
  @moduledoc """
  Retrieve the user information from an auth request
  """

  require Phoenix.Logger
  require Poison

  alias Ueberauth.Auth

  def find_or_create(%Auth{} = auth) do
    # IO.puts("Auth: " <> Poison.encode!(auth))

    name = name_from_auth(auth)

    # Email is used as primary user id key and is required.
    case email_from_auth(auth) do
      {:ok, email} ->
        {:ok, %{id: auth.uid, email: email, name: name}}
      {:error, reason} ->
        {:error, "Email not retrieved: " <> reason}
      _ ->
        {:error, "Failed to parse auth, reason unknown"}
    end
  end

  defp name_from_auth(auth) do
    if auth.info.name do
      auth.info.name
    else
      name = [auth.info.first_name, auth.info.last_name]
      |> Enum.filter(&(&1 != nil and &1 != ""))

      cond do
        length(name) == 0 ->
          auth.info.nickname
        true ->
          Enum.join(name, " ")
      end
    end
  end

  defp email_from_auth(auth) do
    if auth.info.email do
      {:ok, auth.info.email}
    else
      {:error, "Email not found in auth.info.email field"}
    end
  end
end