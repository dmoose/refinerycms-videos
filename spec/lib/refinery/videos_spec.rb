require 'spec_helper'

module Refinery
  describe Videos do
    describe ".reset!" do
      it "should set use_nginx_upload_module back to the default value" do      
        subject.use_nginx_upload_module.should == subject::DEFAULT_USE_NGINX_UPLOAD_MODULE
        subject.use_nginx_upload_module = true
        subject.use_nginx_upload_module.should_not == subject::DEFAULT_USE_NGINX_UPLOAD_MODULE
        subject.reset!
        subject.use_nginx_upload_module.should == subject::DEFAULT_USE_NGINX_UPLOAD_MODULE
      end
      
      it "should set upload_progress_uri back to the default value" do      
        subject.upload_progress_uri.should == subject::DEFAULT_UPLOAD_PROGRESS_URI
        subject.upload_progress_uri = '/something/progress'
        subject.upload_progress_uri.should_not == subject::DEFAULT_UPLOAD_PROGRESS_URI
        subject.reset!
        subject.upload_progress_uri.should == subject::DEFAULT_UPLOAD_PROGRESS_URI
      end
    end
  end
end
