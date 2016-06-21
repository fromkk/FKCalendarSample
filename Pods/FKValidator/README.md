# FKValidator

FKValidator is library of validation with Swift.

# Usage

```swift
let validator :FKValidator = FKValidator()
```

## Add rules

```swift
// Required rule
validator.addRule(FKValidatorRuleRequired())

// max length
validator.addRule(FKValidatorRuleMaxLength(length: 10))
```

## Check validation

```swift
validator.run("string") //true
validator.run("10 length.") //true

validator.run("11 length..") //false
validator.errors // Array <NSError>
```

## Custom message

```swift
validator.addRule(FKValidatorRuleExactLength(length: 5, "value is not 5 length."))
validator.run("1234")
validator.errors // Array <NSError NSLocalizedDescriptionKey: "value is not 5 length." >
```
