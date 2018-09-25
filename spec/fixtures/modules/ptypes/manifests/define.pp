define ptypes::define (
  Any $val
) {
  notify { 'type':
    message => String.new(type($val), '%s'),
  }
  notify { 'value':
    message => String.new($val),
  }
}
