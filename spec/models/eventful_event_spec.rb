require 'rails_helper'

describe EventfulEvent do
  let(:eventful_event) { EventfulEvent.new({}) }

  describe "attributes" do
    subject { eventful_event }

    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:date) }
    it { is_expected.to respond_to(:time) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:venue_name) }
    it { is_expected.to respond_to(:venue_url) }
    it { is_expected.to respond_to(:venue_address) }
  end
end
