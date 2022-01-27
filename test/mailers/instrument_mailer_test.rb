require 'test_helper'

class InstrumentMailerTest < ActionMailer::TestCase
  test "instrument_created" do
    mail = InstrumentMailer.instrument_created
    assert_equal "Instrument created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
