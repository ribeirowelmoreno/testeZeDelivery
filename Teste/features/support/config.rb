# frozen_string_literal: true

require "yaml"

module Config
  # Lê um arquivo YML passando o nome do arquivo como parametro
  #
  # @param filename [String] o nome do arquivo YML
  # @return [Hash{String,Number => String,Number,Boolean}] o conteudo do arquivo YML

  def self.load_config(filename: "data")
    YAML.safe_load(File.read("config/#{filename}.yml"), permitted_classes: [], permitted_symbols: [], aliases: true)
  end
end
