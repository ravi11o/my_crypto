defmodule MyCryptoWeb.PageController do
  use MyCryptoWeb, :controller

  alias MyCrypto.ApiFetcher

  def index(conn, _params) do
    coins = ApiFetcher.list_coins()
    render conn, "index.html", coins: coins
  end

  def show(conn, %{"coin" => coin}) do
    coin = ApiFetcher.single_coin(coin)
    render conn, "show.html", coin: coin
  end

  def search(conn, %{"search_input" => %{"search" => coin}}) do
    coin = ApiFetcher.single_coin(coin)
    render conn, "show.html", coin: coin
  end
end
