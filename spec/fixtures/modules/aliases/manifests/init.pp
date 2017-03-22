class aliases (
  Aliases::Shape $shape
) {
  $x = aliases::myfunc($shape)
  notify { $x: }
}
