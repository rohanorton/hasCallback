getParameterNames = require 'get-parameter-names'
arg = require 'arg-err'

validateArgs = (fn, userDefinedNames) ->
    args = { fn: fn, userDefinedNames: userDefinedNames }
    err = arg.err(args, {
        fn: 'function',
        userDefinedNames: ['string', 'array']
    })
    err? && throw err

hasCallback = (fn, userDefinedNames = []) ->
    validateArgs(fn, userDefinedNames)
    args = getParameterNames(fn)
    callbackNames = [ 'callback', 'cb', 'done', 'next', userDefinedNames... ]
    re = new RegExp(callbackNames.join('|'))
    re.test(args)

module.exports = hasCallback
