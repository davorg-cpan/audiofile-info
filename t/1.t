use Test::More;
BEGIN { use_ok('AudioFile::Info') }

my $ai = AudioFile::Info->new(
  'dummy.mp3',
  { mp3 => 'AudioFile::Info::Dummy' },
);

ok($ai, 'Got something');

isa_ok($ai, 'AudioFile::Info::Dummy');

is($ai->artist, 'ARTIST', 'Artist is correct');

# Hard to test anything really as we don't have any plugins installed
# at this point
#
# Hmm... ok, let's try and test some stuff that shouldn't work :)

eval { AudioFile::Info->new };
ok($@, 'Dies on no file');

eval { AudioFile::Info->new('file_with_no_ext') };
ok($@, 'Dies on file with no extension');

eval { AudioFile::Info->new('file_with_bad_ext.foo') };
ok($@, 'Dies on file with unknown extension');

done_testing;
