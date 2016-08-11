class spec::test_class (
  $message = 'test_message',
) {
  notify { 'spec_class' :
    message => $message,
  }
}
