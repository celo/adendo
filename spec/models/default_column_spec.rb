require 'spec_helper'

describe DefaultColumn do
  context 'validates' do
    it { should validate_presence_of :name }
  end
end
