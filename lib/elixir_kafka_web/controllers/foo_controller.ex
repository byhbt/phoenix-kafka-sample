defmodule ElixirKafkaWeb.FooController do
  use ElixirKafkaWeb, :controller

  def create(conn, params) do
    message = %{
      customer_id: 123,
      month: 9,
      amount_paid: 456.78,
      message: params["content"]
    }

    Kaffe.Producer.produce_sync("emails", "content", Jason.encode!(message))

    redirect(conn, to: Routes.page_path(conn, :index))
  end
end
