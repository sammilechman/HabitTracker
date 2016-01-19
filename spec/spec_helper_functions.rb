module Helpers
  def assert_true(statement)
    assert_equal(true, statement)
  end

  def assert_false(statement)
    assert_equal(false, statement)
  end

  def assert_valid(object)
    assert_true(object.valid?)
  end

  def assert_not_valid(object)
    assert_false(object.valid?)
  end
end
