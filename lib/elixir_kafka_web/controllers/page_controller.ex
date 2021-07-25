defmodule ElixirKafkaWeb.PageController do
  use ElixirKafkaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
