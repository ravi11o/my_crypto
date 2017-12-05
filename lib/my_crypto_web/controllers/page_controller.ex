defmodule MyCryptoWeb.PageController do
  use MyCryptoWeb, :controller

  alias MyCrypto.ApiFetcher

  def index(conn, _params) do
    coins = ApiFetcher.selected_coin()
    render conn, "index.html", coin: coins
  end
end
