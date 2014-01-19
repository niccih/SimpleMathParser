require_relative 'spec_helper'
require_relative 'lexar'

describe Lexar do
  let(:input) { '3a2c4' }
  subject { described_class.new(input.dup) }

  it 'should initialize with an input string' do
    subject.instance_variable_get(:@input).should eq input
  end

  describe "#get_next_token" do
    it 'should return a token object' do
      subject.get_next_token.should be_a(Token)
    end
    it 'should return a token object value set to the first character from the input string variable' do
      subject.get_next_token.value.should eq input[0..0].to_f
    end

    it 'should remove the last returned token from the input variable' do
      subject.get_next_token
      subject.instance_variable_get(:@input).should eq input[1..-1]
    end

    context 'when given token is an operator' do
      OPERATORS = %w{a b c d e f}
      TOKEN_OPERATORS = {
        a: 0,
        b: 1,
        c: 2,
        d: 3,
        e: 5,
        f: 6
      }

      OPERATORS.each do |operator|
        subject = described_class.new(operator)
        it "correctly returns the token.kind for operator: #{operator}" do
          subject.get_next_token.kind.should eq TOKEN_OPERATORS[operator.to_sym]
        end
      end
    end
  end
end
