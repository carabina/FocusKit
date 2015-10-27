Pod::Spec.new do |s|
    s.name = 'FK'
    s.version = '0.1.1'
    s.license = { :type => 'AGPL-3.0', :file => 'LICENSE' }
    s.summary = 'Search Made Easy In Swift'
    s.homepage = 'http://www.graphkit.io/'
    s.social_media_url = 'https://www.facebook.com/graphkit'
    s.authors = { 'GraphKit Inc.' => 'support@graphkit.io' }
    s.source = { :git => 'https://github.com/GraphKit/FocusKit.git', :tag => s.version }
    s.ios.deployment_target = '8.0'
    s.source_files = 'Source/*.swift'
    s.requires_arc = true
end
