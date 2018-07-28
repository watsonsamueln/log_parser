require_relative '../../lib/log_parser.rb'

describe LogParser do
  include LogParser
  context 'self#parse' do
    context 'with valid args' do      
      it 'parses' do
        expected_keys = ["/help_page/1", "/contact", "/home", "/about/2", "/index", "/about"]
        valid_args = parse_log(log: 'spec/fixtures/webserver.log')
        expect(valid_args.keys).to eq expected_keys
        expect(valid_args.first[0]).to eq '/help_page/1'
        expect(valid_args.first[1][0]).to eq '126.318.035.038'
      end
    end

    context 'with invalid args' do
      it 'returns blank hash' do
        expect(parse_log(log: 27).empty?).to eq true
      end
    end
  end
end
