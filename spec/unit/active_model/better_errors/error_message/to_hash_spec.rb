# encoding: utf-8

require 'spec_helper'

describe ErrorMessage, '#to_hash' do
  subject       { object.to_hash }

  let(:object)    { described_class.new base, field, error }
  let(:base)      { User.new }
  let(:field)     { :name }
  let(:error)     { { type: type, message: message, options: options } }
  let(:type)      { :invalid }
  let(:message)   { 'is invalid' }
  let(:options)   { {} }

  let(:expected) do
    {
      attribute: field,
      type: type,
      message: message,
      options: options
    }
  end

  its(:to_hash) { should == expected }
end