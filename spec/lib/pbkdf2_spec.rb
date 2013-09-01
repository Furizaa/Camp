require 'pbkdf2'

describe Pbkdf2, '#hash_password' do

  let(:hash) { Pbkdf2::hash_password('1', '', 1) }

  it 'hashes a string correctly' do
    expect(hash).to eq("62c21a73192f51d88b3a3a3d0d075d482dc0f3361d8f891fb5763c4b7259f24f")
  end

  it 'makes use of multible iterations' do
    expect(Pbkdf2::hash_password('1', '', 2)).not_to eq(hash)
  end

  it 'makes use of a provided salt' do
    expect(Pbkdf2::hash_password('1', '1', 1)).not_to eq(hash)
  end
end
