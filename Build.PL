use Module::Build;
my $build = new Module::Build(module_name => 'AudioFile::Info',
			      license => 'perl',
			      requires => {
					   perl           => '5.6.0',
					   MP3::ID3Lib    => 0,
					   Ogg::Vorbis::Header => 0
					  },
			     );
$build->create_build_script;

