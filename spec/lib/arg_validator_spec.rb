require_relative '../../lib/arg_validator.rb'

describe ArgValidator do
  context '#single_file_given?' do
    context 'with valid args' do
      let(:valid) { described_class.new(args: ['file/path.txt']) }
      let(:invalid) { described_class.new(args: ['file/path.exe']) }
      it 'returns true on valid filepath' do
        expect(valid.single_file_given?).to eq true
      end

      it 'returns false on valid filepath' do
        expect(invalid.single_file_given?).to eq false
      end
    end

    context 'with invalid args' do
      let(:bad_arg) { described_class.new(args: { file: 'server.log' }) }
      it 'defaults to false' do
        expect(bad_arg.single_file_given?).to eq false
      end
    end
  end
end
