use Module::Build;
my $build = new Module::Build(module_name => 'AudioFile::Info',
			      license => 'perl',
			      requires => {
					   perl => '5.6.0',
                                           YAML => 0
					  },
                              create_makefile_pl => 'passthrough'
			     );
$build->create_build_script;

