package AudioFile::Info::MP3;

use 5.006;
use strict;
use warnings;
use Carp;

use MP3::ID3Lib;

our $VERSION = '0.01';

my %data = (artist => 'TPE1',
            title  => 'TIT2',
            album  => 'TALB',
            track  => 'TRCK',
            year   => 'TYER',
            genre  => 'TCON');

sub new {
  my $class = shift;
  my $file = shift;
  my $obj = MP3::ID3Lib->new($file);

  bless { obj => $obj }, $class;
}

sub DESTROY {}

sub AUTOLOAD {
  our $AUTOLOAD;

  my ($pkg, $sub) = $AUTOLOAD =~ /(.+)::(\w+)/;

  die "Invalid attribute $sub" unless exists $data{$sub};

  for (@{$_[0]->{obj}->frames}) {
    return $_->value if $_->code eq $data{$sub};
  }
}


1;
__END__

=head1 NAME

AudioFile::Info::MP3 - Perl extension to get info from MP3 files.

=head1 DESCRIPTION

See L<AudioFile::Info>.

=head1 AUTHOR

Dave Cross, E<lt>dave@dave.org.ukE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2003 by Dave Cross

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
