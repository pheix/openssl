use Test;
use OpenSSL::Digest;

plan 5;

my $test-str = "foo bar";
my $test-buf = $test-str.encode: 'ascii';
my $sha1 = [~] .list».fmt: "%02x" given sha1 $test-buf;
my $sha256 = [~] .list».fmt: "%02x" given sha256 $test-buf;
my $sha384 = [~] .list».fmt: "%02x" given sha384 $test-buf;
my $sha512 = [~] .list».fmt: "%02x" given sha512 $test-buf;

is $sha1, '3773dea65156909838fa6c22825cafe090ff8030', "sha1";
is $sha256, 'fbc1a9f858ea9e177916964bd88c3d37b91a1e84412765e29950777f265c4b75', "sha256";
is $sha384, '6839312f3db343477070d3c0b2becd417b357154d48794d01d78cfb4617ed5ab819a77b6832f6542dd18bb738131ef7e', "sha384";
is $sha512, '65019286222ace418f742556366f9b9da5aaf6797527d2f0cba5bfe6b2f8ed24746542a0f2be1da8d63c2477f688b608eb53628993afa624f378b03f10090ce7', 'sha512';
is md5('abc'.encode: 'ascii').list».fmt("%02x").join, '900150983cd24fb0d6963f7d28e17f72', "md5";
