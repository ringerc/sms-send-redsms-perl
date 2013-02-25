use inc::Module::Install 0.77;

all_from      'lib/SMS/Send/RedOxygen.pm';
requires      'Carp'            => 0;
requires      'SMS::Send'       => '1.06';
requires      'LWP'             => '5.69';
test_requires 'Test::More'      => '0.47';

WriteAll;
