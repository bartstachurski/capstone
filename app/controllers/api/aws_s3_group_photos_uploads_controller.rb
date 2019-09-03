class Api::AwsS3GroupPhotosUploadsController < ApplicationController
  def create
    s3_resource = Aws::S3::Resource::new(region: ENV["AWS_REGION"])
    object = s3_resource.bucket("brewtrip-group-photos").object("image")
    @presigned_url = object.presigned_url(:put)
    render 'show.json.jb'
  end
end
