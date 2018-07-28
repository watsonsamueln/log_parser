require_relative '../../lib/server_details.rb'

describe ServerDetails do
  context '#pageviews' do
    let(:server_log) { 'spec/fixtures/webserver.log' }
    let(:res_1)      { '/about/2' }
    let(:res_2)      { 90 }
    let(:res_3)      { 22 }

    context 'with valid args' do
      let(:valid_log) { described_class.new(log: server_log) }

      it 'displays pageviews in descending order by default' do
        expect(valid_log.pageviews.first.page).to eq res_1
        expect(valid_log.pageviews.first.total).to eq res_2
        expect(valid_log.pageviews.first.unique).to eq res_3
      end
    end

    context 'with invalid args' do
      let(:invalid_log_1) { described_class.new(log: 'not/a/file.txt') }
      let(:invalid_log_2) { described_class.new(log: 42) }
      let(:invalid_log_3) { described_class.new }

      it 'returns a blank array' do
        expect(invalid_log_1.pageviews).to eq []
        expect(invalid_log_2.pageviews).to eq []
        expect(invalid_log_3.pageviews).to eq []
      end
    end
  end
end
