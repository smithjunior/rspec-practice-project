describe 'suite rspec' do
  it 'soma de valores' do
    soma = 10 + 5
    expect(soma).to eql 15
    expect(soma.to_s).to eql '15'
  end
end
