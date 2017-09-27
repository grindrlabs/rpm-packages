class Base < FPM::Cookery::Recipe
  description    'Base environment settings package'
  name           'base'
  homepage       'https://github.com/grindrlabs/rpm-packages'
  section        'main'
  version        '1.0.0'
  maintainer     'GrindrLabs <grindrlabs@grindr.com>'
  source         File.join(File.dirname(__FILE__), "README.md"), with: 'local_path'
  arch           'all'
  pre_install    'pre-install'
  post_install   'post-install'

  depends        'fortune-mod', 'cowsay'

  def build
  end

  def install
    # Make the initial paths used by other packages
    %w(
      /company/bin
    ).map do |dir|
      (destdir/dir).mkpath
    end

    # Copy important script
    etc('profile.d').install workdir('files/script_of_the_day.sh') => 'script.sh'
  end
end
