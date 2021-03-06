((identifier) @field
 (#match? @field "^_"))

((identifier) @field
 (#match? @field "^m_"))

((identifier) @field
 (#match? @field "_$"))

(parameter_declaration
  declarator: (reference_declarator) @parameter)
; function(Foo ...foo)
(variadic_parameter_declaration
  declarator: (variadic_declarator
                (identifier) @parameter))
; int foo = 0
(optional_parameter_declaration
    declarator: (identifier) @parameter)

;(field_expression) @parameter ;; How to highlight this?
(template_function
  name: (identifier) @function)

(template_method
  name: (field_identifier) @method)

(template_function
  name: (scoped_identifier
    name: (identifier) @function))

(namespace_identifier) @constant

((identifier) @type (#match? @type "^[A-Z]"))

((namespace_identifier) @type
                        (#match? @type "^[A-Z]"))
((namespace_identifier) @constant
                        (#match? @constant "^[A-Z][A-Z_0-9]*$"))

(destructor_name
  name: (_) @function)

(function_declarator
      declarator: (scoped_identifier
        name: (identifier) @function))
((function_declarator
      declarator: (scoped_identifier
        name: (identifier) @constructor))
 (#match? @constructor "^[A-Z]"))

(operator_name) @function

(call_expression
  function: (scoped_identifier
              name: (identifier) @function))

(call_expression
  function: (field_expression
              field: (field_identifier) @function))

((call_expression
  function: (scoped_identifier
              name: (identifier) @constructor))
(#match? @constructor "^[A-Z]"))

((call_expression
  function: (field_expression
              field: (field_identifier) @constructor))
(#match? @constructor "^[A-Z]"))

;; constructing a type in a intizializer list: Constructor ():  **SuperType (1)**
((field_initializer
  (field_identifier) @constructor
  (argument_list))
 (#match? @constructor "^[A-Z]"))


; Constants

(this) @constant.builtin
(nullptr) @constant

(true) @boolean
(false) @boolean

; Literals

(raw_string_literal)  @string

; Keywords

[
 "try"
 "catch"
 "noexcept"
 "throw"
] @exception


[
 "class"
 "decltype"
 "constexpr"
 "delete"
 "explicit"
 "final"
 "friend"
 "mutable"
 "namespace"
 "new"
 "override"
 "private"
 "protected"
 "public"
 "template"
 "typename"
 "using"
 "virtual"
 (auto)
] @keyword

"::" @operator
"..." @operator

; Annotations (not fully supported by parser)

((ERROR) @attribute
         (vim-match? @attribute  "\[?\[.*\]\]?.*$"))
(attribute) @attribute
