package AudioFile::Info;

use 5.006;
use strict;
use warnings;
use Carp;

use AudioFile::Info::Ogg;
use AudioFile::Info::MP3;

our $VERSION = '0.01';


# Preloaded methods go here.

sub new {
  my $class = shift;
  my $file = shift or die "No music file given.";

  if ($file =~ /\.ogg$/i) {
    return AudioFile::Info::Ogg->new($file);
  } elsif ($file =~ /\.mp3$/i) {
    return AudioFile::Info::MP3->new($file);
  }
}


1;
__END__

=head1 NAME

AudioFile::Info - Perl extension to get info from audio files.

=head1 SYNOPSIS

  use AudioFile::Info;

  my $song = AudioFile::Info->new($some_mp3_or_ogg_vorbis_file);

  print 'Title:  ', $song->title, "\n",
        'Artist: ', $song->artist, "\n".
        'Album:  ', $song->album, "\n",
        'Track:  ', $song->track, "\n";
        'Year:   ', $song->year, "\n",
        'Genre:  ', $song->genre, "\n";

=head1 ABSTRACT

AudioFile::Info is a simple way to get track information out of an audio
file. It gives a unified interface for extracting information from both
MP3 and Ogg Vorbis files.

=head1 DESCRIPTION

=head2 What is AudioFile::Info

I rip all of my audio files into Ogg Vorbis files. But some of my older
rips are in MP3 format. If I'm writing a program to access information
from my audio files it's annoying when I have to handle MP3 and Ogg
Vorbis files completely separately.

AudioFile::Info is my solution to that problem. It works on both MP3
and Ogg Vorbis files and gives an identical interface for dealing with
both of them.

AudioFile::Info is just a wrapper around the modules MP3::ID3Lib and
Ogg::Vorbis::Header, so you'll need to have these installed.

Incidently, it's also got a simpler inteface than either of its two
underlying modules.

=head2 Using AudioFile::Info

To use AudioFile::Info in your programs you simply load the module
as normal.

  use AudioFile::Info;

You then create an object using the C<new> method and passing it the
pathname of an audio file.

  my $song = AudioFile::Info->new($some_mp3_or_ogg_vorbis_file);

The module works out whether the file is in MP3 or Ogg Vorbis format and
creates an object which can extract the information from the correct
type of file. You can then use this object to access the various pieces
of information about the file.

  print 'Title:  ', $song->title, "\n",
        'Artist: ', $song->artist, "\n".
        'Album:  ', $song->album, "\n",
        'Track:  ', $song->track, "\n";
        'Year:   ', $song->year, "\n",
        'Genre:  ', $song->genre, "\n";

Currently you can access the title, artist, album, track number, year
and genre of the file.

Currently you can only read data from the files. You can't alter it an
write it back.

=head2 EXPORT

None.

=head1 SEE ALSO

=over 4

=item *

L<MP3::ID3Lib> (which is a wrapper around I<id3lib>,
L<http://id3lib.sourceforge.net/>)

=item *

L<Ogg::Vorbis::Header>

=back

=head1 TO DO

=over 4

=item *

Using alternative ID3 and Ogg Vorbis header reading modules.

=item *

Make more data available.

=item *

Changing and writing data.

=back

=head1 AUTHOR

Dave Cross, E<lt>dave@dave.org.ukE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2003 by Dave Cross

This library is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
