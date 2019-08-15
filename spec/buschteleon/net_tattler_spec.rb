RSpec.describe Buschtelefon::NetTattler do
  describe '#initialize' do
    context 'when called without a port argument' do
      let(:instance) { described_class.new }

      before do
        allow_any_instance_of(Kernel).to receive(:rand).and_return(4)
      end

      it 'assigns a random port' do
        expect(instance.port).to eq(4)
      end
    end
  end

  describe '#listen' do
    let(:instance) { described_class.new(port: 9999) }
    let(:gossip) { Buschtelefon::Gossip.new('blub') }

    around do |example|
      receiver = Thread.new { instance.listen }
      example.run
      receiver.kill
    end

    after do
      sleep(0.1) # Waiting for packets to be sent
      sleep(1) if ENV['CI']
    end

    it 'receives a UDP packet and handles it' do
      expect(instance).to receive(:feed).with(gossip)
      UDPSocket.new.send(gossip.message, 0, 'localhost', 9999)
    end

    it 'handles knowledge inquiry' do
      expect(instance).not_to receive(:feed)
      UDPSocket.new.send("\x05", 0, 'localhost', 9999)
    end
  end
end
