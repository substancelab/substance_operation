require 'substance_operation'
require "spec_helper"

RSpec.describe Substance::Operation do
  let(:user) { Object.new }

  describe "operation class" do
    subject do
      described_class.new(user)
    end

    it "can be initialized with a user" do
      expect(subject).to be_instance_of(Substance::Operation)
    end

    it "requires an user on initialization" do
      expect { described_class.new }.to raise_exception(ArgumentError)
    end

    it "does not expose the user" do
      expect { subject.user }.to raise_exception(NoMethodError)
    end

    describe "#process" do
      it "cannot be called directly on super class" do
        expect { subject.process([]) }.to raise_exception(NotImplementedError)
      end
    end
  end

  describe "operation subclass" do
    class TestOperation < Substance::Operation
      def process(*)
        self.success = true
      end
    end

    subject do
      TestOperation.new(user)
    end

    it "is a subclass of Operation" do
      expect(subject.class.superclass).to eq(Substance::Operation)
    end

    describe "#success?" do
      it "defaults to nil" do
        expect(subject.success?).to eq(nil)
      end

      context "if success attribute has been set" do
        it "reflects the change" do
          allow(subject).to receive(:success) { true }

          expect(subject.success?).to eq(true)
        end
      end
    end

    describe "#process" do
      it "does not raise an exception" do
        expect { subject.process }.to_not raise_exception
      end

      it "runs the process code" do
        expect { subject.process }.
          to change { subject.success? }.
          from(nil).to(true)
      end
    end
  end
end
