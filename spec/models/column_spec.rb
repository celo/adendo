require 'spec_helper'

describe Column do
  context 'validates' do
    it { should validate_presence_of :value }
  end
end
