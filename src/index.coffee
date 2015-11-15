getParameterNames = require 'get-parameter-names'

hasCallback = (fn) ->
    throw new Error('NOARGS') unless fn?
    throw new TypeError('BADARGS') unless typeof fn is 'function'
    args = getParameterNames(fn)
    /callback|cb|done|next/.test(args)

module.exports = hasCallback
