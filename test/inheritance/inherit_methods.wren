class Foo {
  methodOnFoo { io.write("foo") }
  method(a) { io.write("foo") }
  method(a, b, c) { io.write("foo") }
}

class Bar is Foo {
  methodOnBar { io.write("bar") }
  method(a, b) { io.write("bar") }
  method(a, b, c, d) { io.write("bar") }
}

var bar = Bar.new
bar.methodOnFoo // expect: foo
bar.methodOnBar // expect: bar

// Methods with different arity do not shadow each other.
bar.method(1) // expect: foo
bar.method(1, 2) // expect: bar
bar.method(1, 2, 3) // expect: foo
bar.method(1, 2, 3, 4) // expect: bar

// TODO: Overriding.
// TODO: Private fields.
// TODO: Super (or inner) calls.
// TODO: Grammar for what expressions can follow "is".
// TODO: Prevent extending built-in types.
