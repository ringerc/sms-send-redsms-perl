use inc::Module::Install 0.77;

all_from      'lib/SMS/Send/RedSMS.pm';
requires      'Carp'            => 0;
requires      'SMS::Send'       => '0.02';
requires      'LWP'             => '5.69';
test_requires 'Test::More'      => '0.47';

WriteAll;
