assert = require 'assert'
hasCallback = require '../src/'

describe 'hasCallback', ->

    it 'thows error if invoked without arguments', ->
        fn = -> hasCallback()
        assert.throws fn, 'NOARGS error'

    it 'thows error if invoked with argument that is not a function', ->
        fn = -> hasCallback('this is not a callback')
        assert.throws fn, 'BADARGS error'

    it 'returns false for synchronous function', ->
        fn = (a) -> a
        expected = false
        actual = hasCallback(fn)
        assert.equal(actual, expected)

    it 'returns true for function containing "callback" argument', ->
        fn = (callback) -> callback()
        expected = true
        actual = hasCallback(fn)
        assert.equal(actual, expected)

    it 'returns true for function containing "done" argument', ->
        fn = (done) -> done()
        expected = true
        actual = hasCallback(fn)
        assert.equal(actual, expected)

    it 'returns true for function containing "cb" argument', ->
        fn = (cb) -> cb()
        expected = true
        actual = hasCallback(fn)
        assert.equal(actual, expected)

    it 'returns true for function containing "next" argument', ->
        fn = (next) -> next()
        expected = true
        actual = hasCallback(fn)
        assert.equal(actual, expected)

    it 'is not affected by the function body', ->
        fn = () -> console.log('this function does not take a callback')
        expected = false
        actual = hasCallback(fn)
        assert.equal(actual, expected)

    it 'works on functions with many arguments', ->
        fn = (a, b, c, d, callback) -> callback()
        expected = true
        actual = hasCallback(fn)
        assert.equal(actual, expected)
