class ImportarService < ApplicationService

  def initialize arquivo
    @arquivo = arquivo
  end

  def call
    unless self.validateExtensiopn
      return false
    end

    nome_arquivo = self.salvar_em_disco
    response = self.salvar_no_banco nome_arquivo
  end

  def salvar_em_disco
    caminho = "public/uploads/"
    arquivo_nome = "dados_#{Time.now.to_i}.txt"
    caminho = File.join(Rails.root, caminho, arquivo_nome)
    File.open(caminho, "wb") do |f|
      f.write(@arquivo.read)
    end

    arquivo_nome
  end

  def salvar_no_banco arquivo

    response = {
      total: 0,
      receita: 0,
      lote: Time.now.to_i
    }

    open("#{Rails.root}/app/assets/data/models_data/#{arquivo}") do |file|
        file.each_with_index do |linha, i|
          next if i == 0
          coluna = linha.split("\t")
          pessoa = Pessoa.new
          pessoa.lote = response[:lote]
          pessoa.comprador = coluna[0]
          pessoa.descricao = coluna[1]
          pessoa.preco = coluna[2].to_f
          pessoa.quantidade = coluna[3].to_f
          pessoa.endereco = coluna[4]
          pessoa.fornecedor = coluna[5]
          pessoa.save
          response[:total] += 1
          response[:receita] += (pessoa.quantidade * pessoa.preco)
        end
    end
    response
  end

  def validateExtensiopn
    allow_extensions = ['.txt']
    if allow_extensions.include? File.extname(@arquivo.original_filename)
      true
    end
  end
end


# matriz = []
# matrix = File.readlines('employees_data')
# matrix.each{|value| value.gsub!("\n", '')}
# matrix.each{|row| matriz << row.split("\t")}
# p 'matriz:'
# p matriz

# p matriz[0].size
# matriz = []
# matrix = File.readlines("/app/assets/data/models_data/")
# matrix.each{|value| value.gsub!("\n", '')}
# matrix.each{|row| matriz << row.split("\t")}