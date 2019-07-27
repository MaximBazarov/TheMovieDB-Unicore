platform :ios, '11.0'

target 'TheMovieDB' do
  
  use_frameworks!

  pod 'Nuke'
  pod 'Command'
  pod 'Unicore'

  target 'TheMovieDBTests' do
    inherit! :search_paths
    pod 'SnappyShrimp', :git => 'https://github.com/Unicore/SnappyShrimp', :branch => 'master'
  end

end
