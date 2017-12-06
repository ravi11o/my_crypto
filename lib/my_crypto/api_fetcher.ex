defmodule MyCrypto.ApiFetcher do

  @url "https://api.coinmarketcap.com/v1/ticker/"
  @global "https://api.coinmarketcap.com/v1/global/"
  @coins ["bitcoin", "ethereum", "litecoin", "bitcoin-cash", "ripple", "iota", "dash",
   "litecoin", "monero", "ethereum-classic", "neo", "stellar", "substratum", "electroneum"]

  def global_data() do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(@global)
    Poison.decode!(body)
  end

  def list_coins() do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(@url <> "/?convert=INR&limit=1100")
    body = Poison.decode!(body)
    coins =
      for coin <- @coins do
        Enum.filter(body, fn(%{"id" => value}) -> value == coin end)
      end
    List.flatten(coins)
  end

  def single_coin(coin) do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(@url <> coin <> "/?convert=INR")
    Poison.decode!(body) |> List.first
  end


end
