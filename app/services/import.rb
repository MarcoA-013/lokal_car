
def importa(arquivo)

  open("#{Rails.root}/app/assets/data/#{arquivo}") do |file|
    file.each_with_index do |linha, i|
      next if i == 0
      coluna = linha.split("\t")
      brand = Brand.new
      brand.lote = response[:lote]
      brand.comprador = coluna[0]
      brand.descricao = coluna[1]
      brand.preco = coluna[2].to_f
      brand.quantidade = coluna[3].to_f
      brand.endereco = coluna[4]
      brand.fornecedor = coluna[5]
      brand.save
      response[:total] += 1
      response[:receita] += (brand.quantidade * brand.preco)
    end
  end
  response
end

p 'matriz:'

p matriz

p matriz[0].size
