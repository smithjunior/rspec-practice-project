# frozen_string_literal: true
require_relative '../app/avenger'

describe AvengersHeadQuarter do
  it 'Deve adicionar um vingador' do
    hq = AvengersHeadQuarter.new
    hq.put('Spiderman')

    expect(hq.list).to eql ['Spiderman']
  end

  it 'Deve adicionar uma lista de vingadores' do
    hq = AvengersHeadQuarter.new
    hq.put('Hulk')
    hq.put('Thor')
    hq.put('Spiderman')

    listNotEmpty = hq.list.size > 0

    expect(hq.list).to include 'Thor'
    expect(hq.list.size).to be > 0
    expect(listNotEmpty).to be true
  end

  it 'Thor deve ser o primeiro da lista' do
    hq = AvengersHeadQuarter.new
    hq.put('Thor')
    hq.put('Hulk')
    hq.put('Spiderman')

    expect(hq.list).to start_with('Thor')
  end

  it 'IronMan deve ser o ultimo da lista' do
    hq = AvengersHeadQuarter.new
    hq.put('Thor')
    hq.put('Hulk')
    hq.put('IronMan')

    expect(hq.list).to end_with('IronMan')
  end

  it 'Deve conter o sobrenome Parker' do
    avenger = 'Peter Parker'
    expect(avenger).to match(/Parker/)
    expect(avenger).not_to match(/Papito/)
  end
end
