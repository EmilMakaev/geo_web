defmodule GeoWeb do
  import Plug.Conn
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  def init(options) do
    options
  end

  def call(conn, _opts) do
    conn = Plug.Conn.fetch_query_params(conn)
    latitude = Map.fetch!(conn.params, "latitude") |> String.to_float()
    longitude = Map.fetch!(conn.params, "longitude") |> String.to_float()
    range = Map.fetch!(conn.params, "range") |> String.to_integer()

    GenServerData.fill_state([latitude, longitude], range)

    list = Common.show_list_by_latitude_longitude_range()
    IO.inspect(list)

    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Success! Please check your terminal")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
