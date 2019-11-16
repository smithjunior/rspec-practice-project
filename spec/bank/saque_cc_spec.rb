# frozen_string_literal: true
require_relative '../../app/bank'

describe ContaCorrente do
  describe 'Saque' do
    context 'saque em conta corrente com saldo' do
      before(:all) do
        @cc = ContaCorrente.new(1000.00)
        @cc.saque(200.00)
      end

      it 'então atualiza saldo' do
        expect(@cc.saldo).to eql 800.00
      end
    end

    context 'quando o saldo é zero' do
      before(:all) do
        @cc = ContaCorrente.new(0.00)
        @cc.saque(100.00)
      end

      it 'então exibe mensagem' do
        expect(@cc.mensagem).to eql 'Saldo insuficiente para o saque :('
      end

      it 'e o meu saldo permanance zero' do
        expect(@cc.saldo).to eql 0.00
      end
    end

    context 'quando o saldo é insuficiente' do
      before(:all) do
        @cc = ContaCorrente.new(500.00)
        @cc.saque(501.00)
      end

      it ' então exibe mensagem' do
        expect(@cc.mensagem).to eql 'Saldo insuficiente para o saque :('
      end

      it 'e o meu saldo permanance' do
        expect(@cc.saldo).to eql 500.00
      end
    end

    context 'quando supera o limite de saque' do
      before(:all) do
        @cc = ContaCorrente.new(1000.00)
        @cc.saque(701.00)
      end

      it 'então exibe mensagem de limite' do
        expect(@cc.mensagem).to eql 'Limite maximo por saque é de R$ 700.0'
      end

      it 'e o meu saldo permanance' do
        expect(@cc.saldo).to eql 1000.00
      end
    end
  end
end
