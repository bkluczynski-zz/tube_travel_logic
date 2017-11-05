require 'station'

describe Station do

  subject {described_class.new("dalston",1)}

  it 'should expose a name of station' do
    expect(subject.name).to eq("dalston")
  end

  it 'should expose a zone of station' do
    expect(subject.zone).to eq(1)
  end

end
