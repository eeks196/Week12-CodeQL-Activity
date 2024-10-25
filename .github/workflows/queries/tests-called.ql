/**
 * @description Find all tests that call the `pressActionKey` function.
 * @kind problem
 * @id javascript/find-action-key-tests
 * @problem.severity recommendation
 */
import javascript

/**
 * Checks if a function is a test, appearing within `describe` and `it` blocks.
 */
predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

/**
 * Checks if a function contains a call to `pressActionKey`.
 */
predicate callsPressActionKey(Function test) {
  exists(CallExpr call |
    call.getCalleeName() = "pressActionKey" and
    call.getEnclosingFunction() = test
  )
}

// Selects test functions that call `pressActionKey`
from Function testFunction
where isTest(testFunction) and callsPressActionKey(testFunction)
select testFunction, "This test calls `pressActionKey`."
