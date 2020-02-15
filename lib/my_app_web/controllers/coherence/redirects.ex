defmodule Coherence.Redirects do
  @moduledoc """
  Define controller action redirection functions.

  This module contains default redirect functions for each of the controller
  actions that perform redirects. By using this Module you get the following
  functions:

  * session_create/2
  * session_delete/2
  * password_create/2
  * password_update/2,
  * unlock_create_not_locked/2
  * unlock_create_invalid/2
  * unlock_create/2
  * unlock_edit_not_locked/2
  * unlock_edit/2
  * unlock_edit_invalid/2
  * registration_create/2
  * invitation_create/2
  * confirmation_create/2
  * confirmation_edit_invalid/2
  * confirmation_edit_expired/2
  * confirmation_edit/2
  * confirmation_edit_error/2

  You can override any of the functions to customize the redirect path. Each
  function is passed the `conn` and `params` arguments from the controller.

  ## Examples
      # disable the user_return_to feature on login
      def session_create(conn, _), do: redirect(conn, to: landing_path(conn, :index))

  """
  use Redirects
  # Uncomment the import below if adding overrides
  import MyAppWeb.Router.Helpers

  # Add function overrides below

  # return the user to the login form after logging out
  def session_delete(conn, _), do: redirect(conn, to: session_path(conn, :new))

  # redirect the user to the login page after registering
  def registration_create(conn, _), do: redirect(conn, to: session_path(conn, :new))
end
