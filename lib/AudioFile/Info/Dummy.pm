package AudioFile::Info::Dummy;

use 5.006;
use strict;
use warnings;

sub new {
  return bless {}, $_[0];
}

sub artist { return 'ARTIST' }
sub title  { return 'TITLE'  }
sub album  { return 'ALBUM'  }
sub track  { return 'TRACK'  }
sub year   { return 'YEAR'   }
sub genre  { return 'GENRE'  }

1;

