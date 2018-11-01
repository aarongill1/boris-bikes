require 'Bike'

describe Bike do
  it 'it correctly records and reports working status' do
    expect(subject.working).to eq(true)
    subject.working=(false)
    expect(subject.working).to eq(false)
  end
end
