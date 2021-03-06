# vim:set ft= ts=4 sw=4 et fdm=marker:

use lib 'lib';
use Test::Nginx::Socket;

repeat_each(2);

plan tests => blocks() * repeat_each() * 2;

#no_diff();
#no_long_string();

run_tests();

__DATA__

=== TEST 1: sanity
--- config
    location /read {
        content_by_lua '
            ngx.say(ngx.OK)
            ngx.say(ngx.AGAIN)
            ngx.say(ngx.DONE)
            ngx.say(ngx.ERROR)
        ';
    }
--- request
GET /read
--- response_body
0
-2
-4
-1

