define ptypes::define (
  Any $val
) {
  notify { 'type':
    message => type($val),
  }
}
