getParameterNames = require 'get-parameter-names'

hasCallback = (fn) ->
    throw new Error('Requires argument') unless fn?
    throw new TypeError('Argument must be function') unless typeof fn is 'function'
    args = getParameterNames(fn)
    /callback|cb|done|next/.test(args)

module.exports = hasCallback
