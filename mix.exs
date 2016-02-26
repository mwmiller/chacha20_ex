defmodule Chacha20.Mixfile do
  use Mix.Project

  def project do
    [app: :chacha20,
     version: "0.3.0",
     elixir: "~> 1.2",
     name: "Chacha20",
     source_url: "https://github.com/mwmiller/chacha20_ex",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  def application do
    []
  end

  defp deps do
    [
      {:earmark, ">= 0.0.0", only: :dev},
      {:ex_doc, "~> 0.11.4", only: :dev},
      {:power_assert, "~> 0.0.8", only: :test},
    ]
  end

  defp description do
      """
      Chacha20 symmetric stream cipher
      """
  end
  defp package do
    [
     files: ["lib", "mix.exs", "README*", "LICENSE*", ],
     maintainers: ["Matt Miller"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/mwmiller/chacha20_ex",
              "RFC"   => "https://tools.ietf.org/html/rfc7539",
              }
    ]
  end

end
