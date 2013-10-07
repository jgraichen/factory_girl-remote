require 'spec_helper'

describe FactoryGirl::Remote do

  context 'FactoryGirl' do
    it 'should have a #remote method' do
      expect(FactoryGirl).to respond_to :remote
    end
  end
end
