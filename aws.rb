require 'aws-sdk-s3'
load './local_env.rb' if File.exist?('./local_env.rb')
def send_to_bukkit()
	# Aws.config.update({
  # credentials: Aws::Credentials.new('******', '************')
#})
  s3 = Aws::S3::Resource.new(
  region: ENV['AWS_REGION'],
  secret_access_key: ENV['S3_SECRET'],
  access_key_id: ENV['S3_KEY'])
  bucket = s3.bucket('annaisbn')
  name = File.basename "isbn_file.csv"
  obj = s3.bucket('annaisbn').object(name)
  obj.upload_file(name)
end
# send_to_bukkit(isbn_file.csv)

# def get_dat()
# 	s3 = Aws::S3::Client.new
# 	mybuketfile = s3.get_object(bucket:"annaisbn", key:"isbn_file.csv")
# 	numbr = mybuketfile.body.read
# end
