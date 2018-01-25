describe Rspec::PendingFor do
  # Make the methods callable for the purposes of testing
  module Rspec
    module PendingFor
      extend self
    end
  end

  it 'has a version number' do
    expect(Rspec::PendingFor::VERSION).not_to be nil
  end

  describe '#pending_for' do
    context 'missing args' do
      it('raises an error') do
        expect { Rspec::PendingFor.pending_for }.to raise_error Rspec::PendingFor::EngineOrVersionsRequired
      end
    end
    context 'with engine' do
      it('calls pending when engine is a match') do
        allow(RubyEngine).to receive(:is?).and_return(true)
        expect(Rspec::PendingFor).to receive(:pending)
        expect(Rspec::PendingFor.pending_for(:engine => 'ruby')).to be nil
      end
      it('does not call pending when engine is not a match') do
        allow(RubyEngine).to receive(:is?).and_return(false)
        expect(Rspec::PendingFor).to_not receive(:pending)
        expect(Rspec::PendingFor.pending_for(:engine => 'ruby')).to be nil
      end
    end
    context 'with versions' do
      context 'as nil' do
        it('raises an error') do
          expect { Rspec::PendingFor.pending_for(:versions => nil) }.to raise_error Rspec::PendingFor::EngineOrVersionsRequired
        end
        context 'with engine' do
          it('calls pending when engine is a match') do
            allow(RubyEngine).to receive(:is?).and_return(true)
            expect(Rspec::PendingFor).to receive(:pending)
            expect(Rspec::PendingFor.pending_for(:engine => 'ruby', :versions => nil)).to be nil
          end
          it('does not call pending when engine is not a match') do
            allow(RubyEngine).to receive(:is?).and_return(false)
            expect(Rspec::PendingFor).to_not receive(:pending)
            expect(Rspec::PendingFor.pending_for(:engine => 'ruby', :versions => nil)).to be nil
          end
        end
      end
      context 'as empty array' do
        it('does not call pending when version is not a match') do
          allow(RubyVersion).to receive(:to_s).and_return('2.1.5')
          expect(Rspec::PendingFor).to_not receive(:pending)
          expect(Rspec::PendingFor.pending_for(:versions => [])).to be nil
        end
        context 'with engine' do
          it('calls pending when engine is a match') do
            allow(RubyEngine).to receive(:is?).and_return(true)
            expect(Rspec::PendingFor).to receive(:pending)
            expect(Rspec::PendingFor.pending_for(:engine => 'ruby', :versions => [])).to be nil
          end
          it('does not call pending when engine is not a match') do
            allow(RubyEngine).to receive(:is?).and_return(false)
            expect(Rspec::PendingFor).to_not receive(:pending)
            expect(Rspec::PendingFor.pending_for(:engine => 'ruby', :versions => [])).to be nil
          end
        end
      end
      context 'as string' do
        before { allow(RubyVersion).to receive(:to_s).and_return('2.1.5') }
        context 'version is a match' do
          it('calls pending') do
            expect(Rspec::PendingFor).to receive(:pending)
            expect(Rspec::PendingFor.pending_for(:versions => '2.1.5')).to be nil
          end
          context 'and engine' do
            it('is a match calls pending') do
              allow(RubyEngine).to receive(:is?).and_return(true)
              expect(Rspec::PendingFor).to receive(:pending)
              expect(Rspec::PendingFor.pending_for(:engine => 'ruby', :versions => '2.1.5')).to be nil
            end
            it('is not a match does not call pending') do
              allow(RubyEngine).to receive(:is?).and_return(false)
              expect(Rspec::PendingFor).to_not receive(:pending)
              expect(Rspec::PendingFor.pending_for(:engine => 'ruby', :versions => '2.1.5')).to be nil
            end
          end
        end
        context 'version is not a match' do
          it('does not call pending when version is not a match') do
            expect(Rspec::PendingFor).to_not receive(:pending)
            expect(Rspec::PendingFor.pending_for(:versions => '2.2.3')).to be nil
          end
          context 'and engine' do
            it('is a match does not call pending') do
              allow(RubyEngine).to receive(:is?).and_return(true)
              expect(Rspec::PendingFor).to_not receive(:pending)
              expect(Rspec::PendingFor.pending_for(:engine => 'ruby', :versions => '2.2.3')).to be nil
            end
            it('is not a match does not call pending') do
              allow(RubyEngine).to receive(:is?).and_return(false)
              expect(Rspec::PendingFor).to_not receive(:pending)
              expect(Rspec::PendingFor.pending_for(:engine => 'ruby', :versions => '2.2.3')).to be nil
            end
          end
        end
      end
      context 'as array of strings' do
        before { allow(RubyVersion).to receive(:to_s).and_return('2.1.5') }
        context 'version is a match' do
          it('calls pending') do
            expect(Rspec::PendingFor).to receive(:pending)
            expect(Rspec::PendingFor.pending_for(:versions => %w[2.1.5 2.2.3])).to be nil
          end
          context 'and engine' do
            it('is a match calls pending') do
              allow(RubyEngine).to receive(:is?).and_return(true)
              expect(Rspec::PendingFor).to receive(:pending)
              expect(Rspec::PendingFor.pending_for(:engine => 'ruby', :versions => %w[2.1.5 2.2.3])).to be nil
            end
            it('is not a match does not call pending') do
              allow(RubyEngine).to receive(:is?).and_return(false)
              expect(Rspec::PendingFor).to_not receive(:pending)
              expect(Rspec::PendingFor.pending_for(:engine => 'ruby', :versions => %w[2.1.5 2.2.3])).to be nil
            end
          end
        end
        context 'version is not a match' do
          it('does not call pending when version is not a match') do
            expect(Rspec::PendingFor).to_not receive(:pending)
            expect(Rspec::PendingFor.pending_for(:versions => %w[2.0.0 2.2.3])).to be nil
          end
          context 'and engine' do
            it('is a match does not call pending') do
              allow(RubyEngine).to receive(:is?).and_return(true)
              expect(Rspec::PendingFor).to_not receive(:pending)
              expect(Rspec::PendingFor.pending_for(:engine => 'ruby', :versions => %w[2.0.0 2.2.3])).to be nil
            end
            it('is not a match does not call pending') do
              allow(RubyEngine).to receive(:is?).and_return(false)
              expect(Rspec::PendingFor).to_not receive(:pending)
              expect(Rspec::PendingFor.pending_for(:engine => 'ruby', :versions => %w[2.0.0 2.2.3])).to be nil
            end
          end
        end
      end
    end
  end
end
