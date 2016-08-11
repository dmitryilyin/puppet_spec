define spec::test_define (
  $message = 'test_message',
) {
  notify { "define_${name}_notify" :
    message => "test_define: ${name} - message: ${message}",
  }
}
