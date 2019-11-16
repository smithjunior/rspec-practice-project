# frozen_string_literal: true
require_relative '../../app/bank'

describe ContaPoupanca do
  describe 'Saque' do
    context 'saque em conta poupança com saldo' do
      before(:all) do
        @cp = ContaPoupanca.new(1000.00)
        @cp.saque(200.00)
      end

      it 'então atualiza saldo' do
        expect(@cp.saldo).to eql 800.00
      end
    end

    context 'quando o saldo é zero' do
      before(:all) do
        @cp = ContaPoupanca.new(0.00)
        @cp.saque(100.00)
      end

      it 'então exibe mensagem' do
        expect(@cp.mensagem).to eql 'Saldo insuficiente para o saque :('
      end

      it 'e o meu saldo permanance zero' do
        expect(@cp.saldo).to eql 0.00
      end
    end

    context 'quando o saldo é insuficiente' do
      before(:all) do
        @cp = ContaPoupanca.new(500.00)
        @cp.saque(501.00)
      end

      it ' então exibe mensagem' do
        expect(@cp.mensagem).to eql 'Saldo insuficiente para o saque :('
      end

      it 'e o meu saldo permanance' do
        expect(@cp.saldo).to eql 500.00
      end
    end

    context 'quando supera o limite de saque' do
      before(:all) do
        @cp = ContaPoupanca.new(1000.00)
        @cp.saque(801.00)
      end

      it 'então exibe mensagem de limite' do
        expect(@cp.mensagem).to eql 'Limite maximo por saque é de R$ 800.0'
      end

      it 'e o meu saldo permanance' do
        expect(@cp.saldo).to eql 1000.00
      end
    end
  end
end
