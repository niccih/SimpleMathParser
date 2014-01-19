require_relative 'parser'

describe Parser do
  before(:each) do
    @parser = Parser.new
  end

  it 'should compute 20 when given 3a2c4' do
    @parser.parse('3a2c4').should eq 20
  end

  it 'should compute 17 when given 32a2d2' do
    @parser.parse('32a2d2').should eq 17
  end

  it 'should compute 14208 when given 500a10b66c32' do
    @parser.parse('500a10b66c32').should eq 14208
  end

  it 'should compute 235 when given 3ae4c66fb32' do
    @parser.parse('3ae4c66fb32').should eq 235
  end

  it 'should compute 990 when given 3c4d2aee2a4c41fc4f' do
    @parser.parse('3c4d2aee2a4c41fc4f').should eq 990
  end
end
