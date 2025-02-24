# frozen_string_literal: true

RSpec.describe Rspec::PendingFor::Build do
  it "can be instantiated" do
    expect(described_class.new).to be_a described_class
  end

  describe "#relevant_versions" do
    it "defaults to empty array" do
      expect(described_class.new.relevant_versions).to eq []
    end

    it "nil becomes empty array" do
      expect(described_class.new(:versions => nil).relevant_versions).to eq []
    end

    it "can be set" do
      expect(described_class.new(:versions => "2.2.3").relevant_versions).to eq ["2.2.3"]
    end

    it "can be set to an array" do
      expect(described_class.new(:versions => ["2.2.3", "2.2.1"]).relevant_versions).to eq ["2.2.3", "2.2.1"]
    end
  end

  describe "#relevant_engine" do
    it "defaults to nil" do
      expect(described_class.new.relevant_engine).to be_nil
    end

    it "nil stays nil" do
      expect(described_class.new(:engine => nil).relevant_engine).to be_nil
    end

    it "can be set" do
      expect(described_class.new(:engine => "ruby").relevant_engine).to eq "ruby"
    end
  end

  describe "#reason" do
    it "defaults to nil" do
      expect(described_class.new.reason).to be_nil
    end

    it "nil stays nil" do
      expect(described_class.new(:reason => nil).reason).to be_nil
    end

    it "can be set" do
      expect(described_class.new(:reason => "ruby is broken").reason).to eq "ruby is broken"
    end
  end

  describe "#message" do
    before do
      allow(RubyVersion).to receive(:to_s).and_return(current_version)
      allow(RubyEngine).to receive(:is?).and_return(engine_match)
    end

    let(:engine_match) { true }
    let(:current_version) { "2.1.5" }

    context "current engine matches" do
      it "defaults to a nice message" do
        expect(described_class.new(:engine => "rbx").message).to eq "Behavior is broken due to a bug in the Ruby engine Rubinius"
      end

      context "current version matches" do
        it "defaults to a nice message" do
          expect(described_class.new(:engine => "rbx", :versions => "2.1.5").message).to match(/Behavior is broken in Ruby versions .*2\.1\.5.* due to a bug in the Ruby engine \(Rubinius\)/)
        end
      end

      context "current version does not match" do
        it "has nil message" do
          expect(described_class.new(:engine => "rbx", :versions => "2.0.0").message).to be_nil
        end
      end
    end

    context "current version matches" do
      it "defaults to a nice message" do
        expect(described_class.new(:versions => "2.1.5").message).to match(/Behavior is broken in Ruby versions .*2\.1\.5.* due to a bug in the Ruby engine/)
      end
    end

    context "current version does not match" do
      it "defaults to a nice message" do
        expect(described_class.new(:versions => "2.0.0").message).to be_nil
      end
    end

    context "current engine does not match" do
      let(:engine_match) { false }

      it "defaults to a nice message" do
        expect(described_class.new(:engine => "ruby").message).to be_nil
      end
    end
  end
end
