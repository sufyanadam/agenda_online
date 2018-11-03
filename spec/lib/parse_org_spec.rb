require 'active_support/time'
require 'parse_org'

describe ParseOrg do
  describe '.parse' do
    let(:org_text) { File.read('fixtures/sample_org_file') }
    subject { described_class.parse(org_text) }

    it 'returns an array of tasks' do

    end
  end

  describe '.mark_done' do
    subject { described_class.mark_done(task) }
    let(:task) { "** TODO Buy good charcoal/gas grill\n" }

    it 'changes the state of the task from TODO to DONE' do
      current_time = Time.current
      expect(Time).to receive(:current) { current_time }
      expect(subject).to eq "** DONE Buy good charcoal/gas grill\n   CLOSED: [#{current_time.strftime('%Y-%m-%d %a %H:%M')}]"
    end
  end
end
