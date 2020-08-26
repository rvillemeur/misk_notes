
# variable declaration
prefer const and let
avoid var

# module
prefer code in sub-module with test, and export object, constant and function.
avoid large base of code in a single file.

# statement

Prefer map

Avoid the various `for` loop.

# creating object

```javascript
var parent = Object.assign(Object.create(Object.prototype), {
    publicMethod: function publicMethod() {
    }

    publicSharedVar:"public_parent_var"

    updateSharedVar: function updateSharedVar(value) {
        this.publicSharedVar = value
    }

    create: function create(value) {,
        let self = Object.create(this)
        //Private var and method"
        const privateVar = private_parent_var
        const privateMethod = function privateMethod() {
        }

        self.privilegedVar = privileged_parent_var;
        self.privilegedVar = value
        this.publicSharedVar = value

        self.privilegedMethod = function privilegedMethod() {
        }

        self.updatePrivateVar = function updatePrivateVar(value) {
                privateVar = value
        }
,
        return self
        }
    }
);
```



