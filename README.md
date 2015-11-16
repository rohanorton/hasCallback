hasCallback
===========

Check if function takes callback as argument.

Will check for common callback names in argument footprint:
- callback
- cb
- done
- next

API
---

### `hasCallback(fn, [userDefinedNames])`

#### fn
Type: function

_(Required)_

The function to be tested.

#### userDefinedNames
Type: string | array

User-defined callback name string or list of strings.


Example Usage
-------------

```js
import hasCallback from 'has-callback';

hasCallback(JSON.stringify);
// => false

hasCallback(fs.rename);
// => true
```

Limitations
-----------

This function merely checks the name of function arguments, it is not a reliable
way of checking if a function is asynchronous, for example it will not detect if
a function returns a `Promise`.
