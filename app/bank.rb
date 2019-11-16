class Conta
  attr_accessor :saldo, :mensagem, :limite

  def initialize(saldo)
    self.saldo = saldo
  end

  def saque(saque)
    if saque > saldo
      self.mensagem = 'Saldo insuficiente para o saque :('
    elsif saque > self.limite
      self.mensagem = "Limite maximo por saque é de R$ #{self.limite}"
    else
      self.saldo -= saque
    end
  end
end

class ContaCorrente < Conta
  def initialize(saldo)
    super
    self.limite = 700.00
  end
end

class ContaPoupanca < Conta
  def initialize(saldo)
    super
    self.limite = 800.00
  end
end