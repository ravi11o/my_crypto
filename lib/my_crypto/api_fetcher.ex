defmodule MyCrypto.ApiFetcher do

  @url "https://api.coinmarketcap.com/v1/ticker/"
  @global "https://api.coinmarketcap.com/v1/global/"
  @coins ["bitcoin", "ethereum", "litecoin", "bitcoin-cash", "ripple", "iota", "dash",
   "litecoin", "monero", "ethereum-classic", "neo", "stellar", "substratum", "electroneum"]

  def global_data() do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(@global)
    Poison.decode!(body)
  end

  def selected_coin() do
    response =
      for coin <- @coins do
        {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(@url <> coin <> "/")
        Poison.decode!(body)
      end
      List.flatten(response)
  end


end
