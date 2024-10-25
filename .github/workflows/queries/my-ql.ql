/**
 * @description Find functions that are longer than 10 lines.
 * @kind problem
 * @id javascript/long-function
 * @problem.severity recommendation
 */
import javascript

/**
 * Checks if a function has more than 10 lines.
 */
from Function fn
where fn.getNumLines() > 10
select fn, "This function is longer than 10 lines."
