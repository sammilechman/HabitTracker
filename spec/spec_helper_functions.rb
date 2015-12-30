module Helpers
  def assert_true(statement)
    assert_equal(statement, true)
  end

  def assert_false(statement)
    assert_equal(statement, false)
  end

  def assert_valid(object)
    assert_true(object.valid?)
  end

  def assert_not_valid(object)
    assert_false(object.valid?)
  end
end
